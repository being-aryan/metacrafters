/*
Assessment Requirements
1. Create a variable that can hold a number of NFT's. What type of variable might this be?
2. Create an object inside your mintNFT function that will hold the metadata for your NFTs. 
   The metadata values will be passed to the function as parameters. When the NFT is ready, 
   you will store it in the variable you created in step 1
3. Your listNFTs() function will print all of your NFTs metadata to the console (i.e. console.log("Name: " + someNFT.name))
4. For good measure, getTotalSupply() should return the number of NFT's you have created
*/

// create a variable to hold your NFT's
let a=[];
/* this function will take in some values as parameters, create an
NFT object using the parameters passed to it for its metadata, 
and store it in the variable above.*/
function mintNFT (name,age,eyecolor,gender) {
    const nft={
        'name':name,
        'age':age,
        'eyecolor':eyecolor,
        'gender':gender
    }
    a.push(nft)

}
//create an NFTs in mintNFT function
mintNFT('kundu','21','black','male');
mintNFT('heer','19','blue','female');
mintNFT('nikhil','20','black','male');
mintNFT('bisnoi','25','brown','male');
mintNFT('salmon','57','blue','male');
/*create a "loop" that will go through an "array" of NFT's
and print their metadata with console.log()*/
function listofNFTs () {
    for(x=0;x<a.length;x++){
        console.log('\n');
        console.log('name:'+a[x].name);
        console.log('age:'+a[x].age);
        console.log('eyecolor:'+a[x].eyecolor);
        console.log('gender:'+a[x].gender);
    }
}
// print the total number of NFTs we have minted to the console
function getTotalSupply() {
    return console.log('\ntotalNFTs:'+a.length);
}
//now call the listofNFTs and getTotalSupply function
listofNFTs();
getTotalSupply();


