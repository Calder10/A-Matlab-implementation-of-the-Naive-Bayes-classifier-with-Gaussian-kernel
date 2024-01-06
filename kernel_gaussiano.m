function [S] = kernel_gaussiano(X,x,e)
    %{
    Tesina Algoritmi per l'analisi dei dati Settembre 2018
    Studente: Salvatore Calderaro
    Matricola: 0619384
    Email: salvatorecalderaro01@community.unipa.it
%}
    S=(1/(length(X)*e));
    V=zeros(1,size(x,2));
    % Calcolo della sommatoria delle distribuzioni di densità di
    % probabilità
    for i=1 : size(x,2)
        A=X(:,i);
        % Replico x in un matrice che ha le stesse dimensioni di A 
        Z=repmat(x(i),size(A,1),1);
        D=Z-A;
        % Calcolo i valori del kernel gaussiano
        r=1/sqrt(2*pi*e);
        esp=D.^2/(2*e);
        ris=r*exp(-esp);
        V(i)=sum(ris);
    end
    S=V.*S;
end