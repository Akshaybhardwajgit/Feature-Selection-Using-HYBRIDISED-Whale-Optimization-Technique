function [Leader_score,Leader_pos,Convergence_curve,fName]=WOASA(SearchAgents_no,Max_iter,lb,ub,dim,fobj)
fName = 'WOASATour';
% initialize position vector and score for the leader
Leader_pos=zeros(1,dim);
Leader_score=inf;


%Initialize the positions of search agents
Positions=initialization(SearchAgents_no,dim,ub,lb)>0.5;

Convergence_curve=zeros(1,Max_iter);

t=0;% Loop counter
for i=1:size(Positions,1)       
        whale_fitness(1,i)=feval(fobj,Positions(i,:));   
end
% Main loop
while t<Max_iter
    for i=1:size(Positions,1)
        
        % Calculate objective function for each search agent
        fitness=feval(fobj,Positions(i,:));
      
        % Update the leader
        if fitness<Leader_score 
            Leader_score=fitness; % Update alpha
            Leader_pos=Positions(i,:);
        end
        
    end
    
    a=2-t*((2)/Max_iter); % a decreases linearly fron 2 to 0 
    
    % a2 linearly dicreases from -1 to -2 to calculate t 
    a2=-1+t*((-1)/Max_iter);
    
    % Update the Position of search agents 
    for i=1:size(Positions,1)
        r1=rand(); 
        r2=rand(); 
        
        A=2*a*r1-a;  
        C=2*r2;      
        
        
        b=1;               
        l=(a2-1)*rand+1;  
        
        p = rand();        
      
      % for j=1:size(Positions,2)  
            if p<0.5   
                if abs(A)>=1
%                     rand_leader_index = floor(SearchAgents_no*rand()+1);
%                     X_rand = Positions(rand_leader_index, :);
                    rand_leader_index = tournamentSelection(1./whale_fitness,0.5);
                    X_rand = Positions(rand_leader_index, :)>0.5;
                    D_X_rand=MutationU(dim,Max_iter,X_rand,t);
                    RE=MutationU(dim,Max_iter,Positions(i,:),t);
                    Positions(i,:)=CrossOverU(D_X_rand,RE);      % Eq. (2.8)
                    Positions(i,:) =  sa(X_rand, dim, Max_iter);
                elseif abs(A)<1
%                     D_Leader=abs(C*Leader_pos(j)-Positions(i,j)); % Eq. (2.1)
%                     Positions(i,j)=Leader_pos(j)-A*D_Leader;      % Eq. (2.2)

                   D_Leader = MutationU(dim,Max_iter,Leader_pos,t);
                   
                   Positions(i,:)=CrossOverU(Leader_pos,D_Leader);      % Eq. (2.2)

%                    Positions(i,:) =  sa(Leader_pos, dim, Max_iter);
                  

                end
                
            elseif p>=0.5
              
                distance2Leader=abs(Leader_pos-Positions(i,:));
                % Eq. (2.5)
                Positions(i,:)=distance2Leader*exp(b.*l).*cos(l.*2*pi)+Leader_pos;
            end
        %end
    end
    t=t+1;
    for i=1:size(Positions,1)       
        whale_fitness(1,i)=feval(fobj,Positions(i,:));   
end
    Convergence_curve(t)=Leader_score;
    [t Leader_score];
  Leader_pos = sa(Leader_pos, dim, Max_iter); 
end

