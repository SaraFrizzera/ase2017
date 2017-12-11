# Team 16
Il progetto per la gestione delle ore lavorative si sviluppa essenzialmente in 4 parti:
 - il login
 - la possibilità per un utente di aggiungere ore laorative per una determinata azienda
 - la possibilità di gestire tutti gli utenti da parte di un admin
 - la possibilità di vedere le ore lavorative svolte per una particolare azienda dall'azienda stessa
 
Si ipotizza lo scenario illustrato dalle user stories, dato un insieme di utenti che possono lavorare per le aziende che hanno un account ogni utente può aggiungere ore lavorative attraverso una griglia che mostra la settimana corrente. Durante la creazione dell'evento viene chiesta l'azienda a cui si addebita il lavoro. L'aggiunta dell'attività avviene attraverso una chiamata POST via AJAX. Nella pagina dell'azienda vengono mostrate le ore svolte da ogni singolo utente ed il totale delle ore addebitate all'azienda, attraverso un grafico a torta viene mostrato il numero di ore totali per ogni utente. Al login il sistema riconosce se l'utete è un admin o un utente standard e lo indirizza verso la view appropriata. La pagina dell'admin mostra tutti gli utenti assieme a tutte le ore svolte, da inoltre la possibilità di gestire ogni singolo utente attraverso una griglia.

