pragma solidity ^0.4.2;

 import "test.sol";
 import "token.sol";
contract Users{
  
  struct User{
      string email;
      string password;
      string name;
      address wallet;
    
  }
 test public tests;
 token public tokenss;
 mapping(string => mapping(uint=>uint)) public userAssetStakes;  //key is emailofuser and id of product 
 mapping(string => User) users;

constructor(test _test,token _token){
    tests=_test;
    tokenss=_token;
}


 function createUser(string email,string password,string name,address wall) public { 
     users[email]=User(email,password,name,wall);
}
  

 
function getUserByEmail(string email) public returns (User) {
    return users[email];
}
 
function getMyAssets(string email) public returns (mapping(uint=>uint)) {
 return userAssetStakes[email];   
 }   
 
 function buy(uint id,string email,uint worth) payable{
     tests.getAsset(id).worth-=worth;
     userAssetStakes[email][id]+=worth;
     
     
 }
}