# Team 16
Il progetto per la gestione delle ore lavorative si sviluppa essenzialmente in 4 parti:
 - il login
 - la possibilità per un utente di aggiungere ore laorative per una determinata azienda
 - la possibilità di gestire tutti gli utenti da parte di un admin
 - la possibilità di vedere le ore lavorative svolte per una particolare azienda dall'azienda stessa
 
 # L'Applicazione
 
 ![user_stories](./Team16.jpg)
 
Si ipotizza lo scenario illustrato dalle user stories, dato un insieme di utenti che possono lavorare per le aziende che hanno un account ogni utente può aggiungere ore lavorative attraverso una griglia che mostra la settimana corrente. Durante la creazione dell'evento viene chiesta l'azienda a cui si addebita il lavoro. L'aggiunta dell'attività avviene attraverso una chiamata POST via AJAX. Nella pagina dell'azienda vengono mostrate le ore svolte da ogni singolo utente ed il totale delle ore addebitate all'azienda, attraverso un grafico a torta viene mostrato il numero di ore totali per ogni utente. Al login il sistema riconosce se l'utete è un admin o un utente standard e lo indirizza verso la view appropriata. La pagina dell'admin mostra tutti gli utenti assieme a tutte le ore svolte, da inoltre la possibilità di gestire ogni singolo utente attraverso una griglia.

L'intera applicazione si basa su 4 views, tutti gli eventi di creazione/popolamento delle liste/cancellazione avviene via AJAX utilizando axios per le chiamate POST/GET, le view sono gestite con l'aiuto di Vue.js.

# ERD
![erd](./photo5866381940414852152.jpg)

Lato backend il pattern predominante è quello del Service Object, nel quale si delega la logica della chiamata ad una classe che implementa direttamente il codice o implementa a sua volta altri servizi in combinazione con lo scopo finale di aumentare la centralizzazione del codice e la sua riutilizzabilità.

Esempio di un metodo del servizio per le attività.
```sh
  def find_activity_by_company(headers)
    company = CompanyService.new.find_company headers
    raise ArgumentError, 'company does not exist in database' unless company

    Activity.where(company: company)
  end
```

Al controller spetta il compito di chiamare il servizio e gestire le eventuali eccezioni tramite un handler di servizi definito nella classe base.
```sh
  def find_by_company
    service_handler ActivityService.new.method(:find_activity_by_company), request.headers
  end
```

# Test

I test sono stati implementati seguendo la guida dello stile Rails e seguono la forma:

```sh
  test "the truth" do
    assert true
  end
```

Eseguibili tramite il comando
```sh
  rake test
```

Sono stati implementate 15 funzioni di test per un totale di quasi una trentina di asserzioni.

Licenza MIT
