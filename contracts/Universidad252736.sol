// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract Biblioteca252736 {

    struct Libro {
        uint id;
        string titulo;
        uint paginas;
    }

    Libro[] public libros;

    address public dirContrato;

    constructor() {
        dirContrato = address(this);
        console.log(
            "Ejecutado por: 252736 - Yerson Enrique Diaz Paredes"
        );
    }

    function agregarElemento(uint _id, string memory _titulo, uint _paginas
    ) public {

        libros.push(
            Libro(_id, _titulo, _paginas)
        );
    }

    function contarElementos() public view returns(uint) {
        return libros.length;
    }

}