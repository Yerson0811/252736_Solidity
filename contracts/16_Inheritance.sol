// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract Animal {
    string public specie;

    constructor(string memory _specie) {
        specie = _specie;
    }

    function makeNoise() public pure virtual returns (string memory){
        return "Ahh";
    }

    function getInfo() public view virtual returns (string memory){
        return string(abi.encodePacked("Soy ", specie));
    }
}

contract Dog is Animal {
    constructor() Animal("Perro"){

    }

    function makeNoise() public pure override returns (string memory) {
        return "Guau";
    }

     function getInfo() public view override returns (string memory){
        return string(abi.encodePacked(super.getInfo(), " y hago ", makeNoise()));
    }
}

contract Cat is Animal {
    constructor() Animal("Gato"){

    }

    function makeNoise() public pure override returns (string memory) {
        return "Miau";
    }

     function getInfo() public view override returns (string memory){
        return string(abi.encodePacked(super.getInfo(), " y hago ", makeNoise()));
    }

    function purr() public pure returns (string memory) {
        return "Prrr";
    }
}

contract PetStore{
    Animal[] public animals;

    function addDog(address dogAddress) public{
        //Dog dog = new Dog();
        //animals.push(dog);
        animals.push(Dog(dogAddress));
    }

    function addCat() public{
        Cat cat = new Cat();
        animals.push(cat);
    }

    function getAnimalCount() public view returns (uint){
        return animals.length;
    }

    function getAnimalInfo(uint index) public view returns (string memory){
        return animals[index].getInfo();
    }

    function makeNoise(uint index) public view returns (string memory){
        return animals[index].makeNoise();
    }

}