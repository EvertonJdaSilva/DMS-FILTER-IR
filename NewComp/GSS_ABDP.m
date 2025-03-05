function [D,INk] = GSS_ABDP(func_C,x,epsilon,INk)
%
% Algorithm for constructing the set of generators Dk.
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
%
% Let the current iterate xk and a parameter epsilon > 0 be given.
% Inputs: func_C  - constraints functions
%         x       - the current point
%         epsilon - parameter bigger than zero
%         INk     - index set corresponding to nonredundant constraints
% Outputs:
%          INk - index set corresponding to nonredundant constraints
%          D   - set of polling directions
% User choice
tol       = 1e-6;
% Initialization
IN = []; Ieps = []; Bk = []; BN = [];
[~,A,b] = feval(func_C,x);
A = A'; b = b';
% Defining the new matrix A bar and b bar
for i = 1:size(A,2)
    A_bar(:,i) = A(:,i)/norm(A(:,i),2);
    b_bar(i) = b(i)/norm(A(:,i),2);
end
% Part I: Constructing the set IN(xk,epsilon)
% Constructing the working index set I(xk,epsilon)
m = size(A,2); % A(line,column)
I = (1:m)';
for i = 1:m
    if abs(b_bar(i)-A_bar(:,i)'*x)<= epsilon
        Ieps = [Ieps;i];
        Bk   = [Bk,A(:,i)];
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

% Part II: Constructing the set of generators Dk
r = rank(BN);
if r ~= length(IN) % Degenerate case
    mN = size(BN,2);
    bN = b(IN);
    c_val = BN'*x- bN';
    [~,sorted_idx] = sort(c_val);
    BN_new = [];
    for j=1:length(sorted_idx)
        idx = sorted_idx(j);
        if isempty(BN_new)
            BN_new = BN(:,idx);
            BN_rank_new = 1;
        else
            BN_new_temp = [BN_new BN(:,idx)];
            BN_rank_temp = rank(BN_new_temp);
            if BN_rank_temp > BN_rank_new
                BN_new = BN_new_temp;
                BN_rank_new = BN_rank_temp;
            end
        end
    end
    BN = BN_new;
end

if isempty(BN)  % If we do not have any active constraint we consider the
    % coordinate directions
    D = [eye(length(x)) -eye(length(x))];
else
    % QR decomposition constructs a set of generators by using the
    % QR decomposition.
    [~,R] = qr(BN);
    r = rank(BN);
    % B = Q*R = [Q1 Q2]*[R1 R2; 0 0]
    % Q1 form an orthonormal basis for the space spanned by the columns of B
    Q1 = orth(BN);
    % Q2 form an orthonormal basis for nullspace of B'
    Q2 = null(BN');
    % R1 is upper triangular and rank(R1)=rank(B)
    R1 = R(1:r,1:r);
    D1 = (Q1*R1)/(R1'*R1);
    D2 = Q2;
    D  = [D1,D2,-D1,-D2];
    Daux=zeros(size(D));
    for i=1:size(D,2)
        Daux(:,i)=D(:,i)/norm(D(:,i));
    end
    D = Daux;
end
end