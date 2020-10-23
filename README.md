# Author
Mauricio Macias (mauricio.macias@csu.fullerton.edu) 890741622

## 1 Background
For this project we are implementing a REST server that will manage the following Claim entity in its SQLite3 database. 

## 2 Installation
Inside <br/>
\Source\Claim-IOS\Database.swift <br/>
Modify <br/>
`let dbname = "/Users/mauriciomacias/desktop/ios/data/ClaimDB.sqlite" <br />` <br/>
to <br/>
`let dbname = "/path/ClaimDB.sqlite"` <br/>

## 3 RUN PROGRAM
### 3.1 Press Run
top left press run
### 3.2 browser
In your browser add this to your url
`http://localhost:8020/`
Hello! Welcome to visit the service. <br/>
Should be outputed
### 3.3 postman
Download Postman to test our database <br/>
Click the + plus icon to open a new tab <br/>

## 4 ADD CLAIM
Set your HTTP request to POST. <br/>
Enter `http://localhost:8020/add` in the URL domain. <br/>
Click Body <br/>
Select JSON <br/>
Add Claim by adding this: <br/>
`[{"title":"<title>","date":"<date>"}]` <br/>
Click Send <br/>
Output: `The Claim record was successfully inserted (via POST Method).`

## 5 GET ALL CLAIMS
Set your HTTP request to GET. <br/>
Enter `http://localhost:8020/getAll` in the URL domain. <br/>
Click Send <br/>
Output: All claims recorded.