function [trs , ts]=crea_trs_ts(X,p,C)
    %{
    Tesina Algoritmi per l'analisi dei dati Settembre 2018
    Studente: Salvatore Calderaro
    Matricola: 0619384
    Email: salvatorecalderaro01@community.unipa.it
    %}
    trs=[];
    ts=[];
    for i=1 : length(C)
        % Trovo tutti gli elementi di classe C(i)
        I=find(X(:,end)==C(i));
        % Genero una permutazione random degli indici
        r=randperm(length(I));
        % Trovo il numero di elementi da inserire nel training set
        n=round(length(I)*p);
        % Inserisco nel training set gli elementi r-esimi che vanno da 1 a
        % n in I, prendendo solamente le ultime 10 colonne 
        trs=[trs; X(I(r(1:n)),2:11)];
        % Inserisco gli elementi restanti nel testing set
        ts=[ts; X(I(r(n+1:end)),2:11)];
    end
end