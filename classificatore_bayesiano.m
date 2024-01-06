function [E]=classificatore_bayesiano(trs,ts,C,s,prob)
    %{
    Tesina Algoritmi per l'analisi dei dati Settembre 2018
    Studente: Salvatore Calderaro
    Matricola: 0619384
    Email: salvatorecalderaro01@community.unipa.it
    %}
    
    % Il vettore X conterrà gli elementi della classe j-esima
    X=[];
    
    % Il vettore E conterrà le etichette delle classi i cui gli elmenti
    % sono stati assegnati dal classificatore
    E=zeros(1,length(ts));
    for i=1 : length(ts)
        % Estraggo l'i-esima componente del testing set
        x=ts(i,1:end-1);
        
        % Il vettore v conterrà le probabilità a posteriori
        v=zeros(1,length(C));
        
        % Per ogni classe
        for j=1 : length(C)
            % Trovo tutti gli elementi del training set di classe j-esima
            X=find(trs(:,end)==j);
            I=trs(X,1:end-1);
            % Stimo i likelihood tramite kernel gaussiano, e calcolo le
            % probabilità a posteriori
            v(j)=prob(j)*prod(kernel_gaussiano(I,x,s));
        end
        % Scegliamo l'etichetta da dare all'i-esimo elemento del testing
        % set tramite la regola MAP (Maximum a posteriori probability)
        [~,c]=max(v);
        E(i)=c;
    end
end