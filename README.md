
<h1 align="center">The Cat API -Using Beego</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000" />
</p>

#### Features
- we can search cats images
- We can search Cats images by its Breed
- We can search Cats images by its Category such as Boxes,hats,sunglasses etc
- We can search Cats images by Image type such Jpg,Png,gif
- We can limit image per page by defult it shows 9 images  

#### How to complete this project
- First You should know besic knowledge about Golang,I read several documentation about Golang here is the documentation link  https://www.golangprograms.com/go-language/variables.html
- So after finishing the Golang besic then switch to Beego I read this doucumentation https://beego.vip/
- After that we need to know the cats api as a result we need to read the api documentaion of The Cat API here is the cats  api documentaion link  https://docs.thecatapi.com/

#### prerequisite
- Install Golang
- Install Beego

#### How to install go and beego
 ###### step 1
 - First confirm that you’re in the home directory
 ```bash
   cd ~
```
###### step 2
- Then use curl to retrieve the tarball, 
 ```bash
  curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
```
###### step 3
- To verify the integrity of the file you downloaded, run the sha256sum command and pass it to the filename as an argument
 ```bash
  sha256sum go1.16.7.linux-amd64.tar.gz

```


###### step 4
- Next, use tar to extract the tarball. This command includes the -C flag which instructs tar to change to the given directory before performing any other operations
```bash
 sudo tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz

```

- In this step, you will set paths in your environment.
```bash
  sudo nano ~/.profile


```
###### step 5
- Then, add the following information to the end of your file:

```bash
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/yourpcname/go/bin
export GOPATH="/home/yourpcname/go/"
export GOBIN="/home/yourpcname/go/bin"

```
- After you’ve added this information to your profile, save and close the file. If you used nano, do so by pressing CTRL+X, then Y, and then ENTER.
###### step 6
- After, check if you can execute go commands by running go version:

```bash
 go version
```
###### step 7
- Download and install beego By this command

```bash
go get -u github.com/beego/beego/v2
go get -u github.com/beego/beego/v2
```

###### step 8
- Create Beego project by this command

```bash
new bee project name
```
###### step 9
- Init module

```bash
go mod tidy
```
#### How to run this project 

- Clone this github repository in your pc 
- Then use this command to run this project
```bash
 go mod tidy
 bee run
```

## Feedback

If you have any feedback, please reach out to us at tanvir@w3engineers.com


## 🚀 About Me
I'm a Softwere Engineer Intern...

