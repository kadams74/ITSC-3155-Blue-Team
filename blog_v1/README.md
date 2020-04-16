# SuperBlue - Movies and more ...

### Running the server:
`rails server -b $IP -p $PORT`

#### Get the latest version of the project:
`git pull https://github.com/kadams74/ITSC-3155-Blue-Team master`

### Committing changes to git:
`git add .`

`git commit -m "Changes you've made"`

`git push https://github.com/kadams74/ITSC-3155-Blue-Team master`

### Solve migration pending error:
`rake db:migrate`


#### TODO:
* add content

#### Note:
* `logout_path`, (soon to be; not yet implemented) `signup_path` and `login_path` are NOT being called in the navigation bar -- or anywhere for that matter. Everything is being directed using `controller: 'login'` or `logout` etc
