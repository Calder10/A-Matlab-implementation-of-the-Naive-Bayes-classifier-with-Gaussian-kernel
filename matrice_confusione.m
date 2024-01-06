function [ C ] = matrice_confusione(T, L)
    %{
    Tesina Algoritmi per l'analisi dei dati Settembre 2018
    Studente: Salvatore Calderaro
    Matricola: 0619384
    Email: salvatorecalderaro01@community.unipa.it
    %}

    % T rappresenta la vera classificazione
    
    % L rappresenta la classificazione del classificatore bayesiano 
    
    % Etichette della vera classificazione
    LR = unique(T);
    % Numero di classi
    R = length(LR);

    % Calcolo matrice di confusione
    C = zeros(R, R);
    for i=1:R
        I=find(T==LR(i));
        for j=1:R
            % C(i,j) conterrà il numero di elementi che sono di classe i,
            % ma che il classificatore ha classificato con j
            C(i, j) = length(find(L(I)==LR(j)));
        end        
    end
end