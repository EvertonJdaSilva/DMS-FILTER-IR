function [D,INk] = GSS_ABDP(func_C,x,epsilon,INk,iter,minimal_basis_par)
%% Algorithm for constructing the set of generators Dk.
% As described by Mark A. Abramson, Olga A. Brezhneva, Jhon E. Dennis Jr.
% and Rachael L. Pingeld in "Pattern search in the presence of degenerate
% linear constraints", Optimization Methods & Software, Vol. 23, No. 3,
% (2008), pp. 297–319.
%
% See the previous cited paper for the original reference.
%
% Implemented by Everton J. Silva
%
% Version September 2022.
%%
% Let the current iterate xk and a parameter epsilon > 0 be given.
% Inputs: func_C  - constraints functions
%         x       - the current point
%         INk     - index set corresponding to nonredundant constraints
%         epsilon - parameter bigger than zero
%         iter    - iteration
% Outputs:
%          INk - index set corresponding to nonredundant constraints
%          D   - set of polling directions
%% User choice
tol = 1e-6;
selection = 1;     % Enumeration schemes: 1 for sequential selection and
%                                         2 for random selection
decomp = 2; % Decomposition used to construct directions:
%                                             1 for LU decomposition and
%                                             2 for QR decomposition
%% Initialization
if nargin<5, iter=0; selection = 2; end
IN = []; Ieps = []; Bk = []; BN = [];
inner_iter = 0;

if (inner_iter == 0)
    [~,A,b] = feval(func_C,x);
    A = A'; b = b';
    % Defining the new matrix A bar and b bar
    for i = 1:size(A,2)
        A_bar(:,i) = A(:,i)/norm(A(:,i),2);
        b_bar(i) = b(i)/norm(A(:,i),2);
    end
% else
%     A = A(I,:); b = b(I);
%     A_bar = A(I,:); b_bar = b(I);
end
    


%% Part I: Constructing the set IN(xk,epsilon)
% Constructing the working index set I(xk,epsilon)
m = size(A,2); % A(line,column)
I = (1:m)';
for i = 1:length(I)
    if abs(b_bar(i)-A_bar(:,i)'*x)<=epsilon
        Ieps = [Ieps;i]; %#ok<*AGROW> 
        Bk = [Bk,A(:,i)];
    end
end

if rank(Bk) == length(Ieps)
    % all constraints are nonredundant
    IN = Ieps;
    BN = Bk;
else
    % using information from the previous iterations
    ind = intersect(Ieps,INk);
    for i = 1:length(ind)
        j = ind(i);
        IN = [IN;j];
        BN = [BN,A(:,j)];
    end
    % Identification of the nonredundant and redundant constraints
    ind = setdiff(Ieps,IN);
    for i = 1:length(ind)
        j = ind(i);
        % the first strategy
        % Pj(xk) is the projection of xk onto {x in Rn: a'_jx =b_j}
        Pj = x+A_bar(:,j)*(b_bar(j)-A_bar(:,j)'*x);
        Jaux = setdiff(I,j);
        T = (A_bar(:,Jaux)'*Pj-b_bar(Jaux)'<tol);
        if sum(T) == length(Jaux) % a_bari'*Pj(x)<b_bari for all i in I\j
            % equality at Pj(x) holds for only the jth constraint
            IN  = [IN;j];
            BN  = [BN,A(:,j)];
            INk = [INk;j];
        else
            % The second strategy
            % solve LP problem maximize aj'*x subject to ai'*x<=bi,
            % for i in I/j, let x* be a solution
            Jaux1 = setdiff(I,j); n = size(A,1);
            xstar = fmincon(@(x)(-A(:,j)'*x),zeros(n,1),A(:,Jaux1)',b(Jaux1)');
            if (A(:,j)'*xstar-b(j)<=tol) % the jth constraint is redundant
                % remove aj'*x<=bj from the Omega
                %A(:,j) = [];
                %b(j) = [];
                %take j out of the sets I and I(x,epsilon);
                I = setdiff(I,j);
                Ieps = setdiff(Ieps,j);
            else % the jth constraint is nonredundant
                IN  = [IN;j];
                BN  = [BN,A(:,j)];
                INk = [INk;j];
            end
        end
    end
end

%% Part II: Constructing the set of generators Dk
r = rank(BN);
if r ~= length(IN) % Degenerate case
    mN = size(BN,2);
    C = nchoosek(1:mN,r);
    sk = size(C,1); % sk = factorial(mN)/(factorial(r)*factorial(mN-r));
    switch selection
        case 1
            % Sequential selection
            j = 1+mod(iter,sk);
            BN = BN(:,C(j,:));
        case 2
            % Random selection
            j = randi(sk);
            BN = BN(:,C(j,:));
    end
end

if isempty(BN)  % If we do not have any active constraint we consider the
    % coordinate directions
    if minimal_basis_par
        D = [eye(length(x)) -eye(length(x))];
    else
        D = [eye(length(x)) -sum(eye(length(x)),2)];
    end
else
    switch decomp
        case 1
            % LU decomposition
            [D] = Set_LU(BN);
        case 2
            % QR decompposition
            [D] = Set_QR(BN);
    end
    Daux=zeros(size(D,1),size(D,1));
    for i=1:size(D,1)
        Daux(:,i)=D(:,i)/norm(D(:,i));
    end
    if minimal_basis_par
        D = [Daux -Daux];
    else
        D = [Daux -sum(Daux,2)];
    end
end
inner_iter = inner_iter+1; %#ok<*NASGU> 
end