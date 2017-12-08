
function userLogIn(username, password){
    axios({
            method: 'post',
            url: '/loginUser',
            headers: {
            'Content-Type': 'application/json',
            'username': username,
            'password': password
        }
    })
    .then(function (response) {
        localStorage.setItem('user', JSON.stringify(response.data));
        toastr.success('Bentornato '+username)
        setTimeout(function(){
            GoToMainBoard(1);
        },500);
    })
    .catch(function (error) {
        toastr.warning('Username o password errati')
    });
}

function userSignIn(username, password){
    axios({
            method: 'post',
            url: '/signinUser',
            headers: {
            'Content-Type': 'application/json',
            'username': username,
            'password': password
        }
    })
    .then(function (response) {
        localStorage.setItem('user', JSON.stringify(response.data));
        GoToMainBoard(1);    
    })
    .catch(function (error) {
        toastr.warning('Errore durante la registrazione, username già in uso o valori non validi')
    });
}

function companyLogIn(companyName, vatNumber){
    axios({
            method: 'post',
            url: '/loginCompany',
            headers: {
            'Content-Type': 'application/json',
            'companyName': companyName,
            'vatNumber': vatNumber
        }
    })
    .then(function (response) {
        localStorage.setItem('company', JSON.stringify(response.data));
        toastr.success('login eseguito come '+companyName)
        setTimeout(function(){
            GoToMainBoard(2);
        },500);
    })
    .catch(function (error) {
        toastr.warning('Nome azienda o partita IVA errati')
    });
}

function companySignIn(companyName, vatNumber){
    axios({
            method: 'post',
            url: '/signinCompany',
            headers: {
            'Content-Type': 'application/json',
            'companyName': companyName,
            'vatNumber': vatNumber
        }
    })
    .then(function (response) {
        localStorage.setItem('company', JSON.stringify(response.data));    
        GoToMainBoard(2);    
    })
    .catch(function (error) {
        toastr.warning('Errore Durante la registrazione, nome azienda già in uso o valori non validi')
    });
}