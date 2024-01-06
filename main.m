%{
Tesina Algoritmi per l'analisi dei dati Settembre 2018
Studente: Salvatore Calderaro
Matricola: 0619384
Email: salvatorecalderaro01@community.unipa.it
%}

clear all
close all
clc

% Importo il dataset 
load './glass/data.txt'

% Dimensioni del datset
[N,~]=size(data);

% Classe di appartenenza di tutti gli elementi
c=data(:,11);

% Trovo le etichette delle classi
classi=unique(c);
% Determino il numero delle classi
nclassi=length(classi);

% Creo un vettore di percentuali che mi servirà per la costruzione del
% training set
percentuali=0.2:0.1:0.9;

% Creo un vettore di varianze che mi serviranno per il classificatore
% bayesiano con kernel gaussiano
s=0.1:0.2:1;

% Creo un vettore che conterrà le probabilità a priori, che serviranno per
% il classificatore bayesiano
prob=zeros(1,nclassi);

% Creo un vettore che conterrà i risultati del classificatore
e=[];

% Creo una matrice che conterrà le accuratezze
A=zeros(10,length(s));

% Calcolo le probabilità a priori
for i =1 : nclassi
    I=find(c==classi(i));
    prob(i)=length(I)/N;
end

% Al variare della cardinalità del training set
for i=1 : length(percentuali)
    % Effettuo i 10 run
    for j=1 : 10
        % Creo il training set e il test set
        [trs , ts]=crea_trs_ts(data,percentuali(i),classi);
        % Conservo in rl la classificazione reale del testing set, mi
        % servira dopo per la costruzione della matrice di confusione
        rl=ts(:,end);
        % Al variare della varianza del kernel gaussiano
        for z=1 : length(s)
            % Classificatore bayesiano
            e=classificatore_bayesiano(trs,ts,classi,s(z),prob);
            C=matrice_confusione(rl,e);
            % Calcolo l'accuratezza e salvo il risulato nella matrice A
            A(j,z)=sum(diag(C))/sum(sum(C));
        end
    end
    % Mostro i grafici
    figure('name','Classificatore Bayesiano con Kernel Gaussiano');
    xlabel('Varianza');
    ylabel('Accuratezza');
    hold on
    % Nell'asse delle X avro le varianze, mentre nell'asse Y la media delle
    % accuratezze
    m=mean(A);
    plot(s,m,'-b');
end