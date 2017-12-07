
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
        GoToMainBoard(1);
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
        toastr.warning('Errore Durante la registrazione, credenziali già in uso o non valide')
    });
}

function companyLogIn(companyName, vatNumber){
    debugger;
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
        GoToMainBoard(1);
    })
    .catch(function (error) {
        toastr.warning('companyName o vatNumber errati')
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
        GoToMainBoard(1);    
    })
    .catch(function (error) {
        toastr.warning('Errore Durante la registrazione, credenziali già in uso o non valide')
    });
}