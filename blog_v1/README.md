# SuperBlue - Movies and more ...

### Running the server:
`rails server -b $IP -p $PORT`

#### Get the latest version of the project:
`git clone https://github.com/kadams74/ITSC-3155-Blue-Team.git`

### Committing changes to git:
`git add .`

`git commit -m "Changes you've made"`

`git push https://github.com/kadams74/ITSC-3155-Blue-Team master`

### Solve migration pending error:
`rake db:migrate`


#### TODO:
* Fix the nav bar not using the full 20% per link
* When the window is resized, the nav bar messes up because of "Coming Soon"
* Design a company logo
* Put each page's "SuperBlue" text logo into a "title" div class. Check out `./app/views/welcome/_navigation.html.erb` to see how to incorporate this (along with other div stuff we need to use site-wide)
* Maybe have a shared folder on Google docs for weekly zipped backups. Unless you're all comfortable with git and trust that our project will be safe