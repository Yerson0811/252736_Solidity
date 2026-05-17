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

    constructor() {
        console.log(
            "Ejecutado por: 252736 - Yerson Enrique Diaz Paredes"
        );
    }

}