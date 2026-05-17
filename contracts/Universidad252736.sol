// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract Biblioteca252736 {

    struct Libro {
        uint id;
        string titulo;
        uint paginas;
        bool estado;
    }

    Libro[] public libros;

    address public dirContrato;

    constructor() ejecutadoPor{
        dirContrato = address(this);
    }

    modifier ejecutadoPor() {
        console.log(
            "Ejecutado por: 252736 - Yerson Enrique Diaz Paredes"
        );
        _;
    }

    function agregarElemento(uint _id, string memory _titulo, uint _paginas) public ejecutadoPor{
        //Check de ID no repetido
        for(uint i = 0; i < libros.length; i++) {
            require(libros[i].id != _id,"ID repetido");
        }

        //Check de titulo vacio
        require(bytes(_titulo).length > 0,"Titulo vacio");

        libros.push(
            Libro(_id, _titulo, _paginas, true)
        );
    }

    function contarElementos() public view ejecutadoPor returns(uint) {
        return libros.length;
    }

    function inactivarElemento(uint _posicion) public ejecutadoPor {
        require(_posicion < libros.length,"Posicion invalida");
        libros[_posicion].estado = false;
    }

    function mostrarActivos()public view ejecutadoPor{
        for(uint i = 0; i < libros.length; i++) {
            if(libros[i].estado == true) {
                console.log("Libro activo", libros[i].id, libros[i].titulo);
            }
        }
    }

}