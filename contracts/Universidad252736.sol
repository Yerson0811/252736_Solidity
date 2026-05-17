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

    //Libro[] public libros;

    mapping(uint => Libro) public libros;

    mapping(uint => bool) public existe;

    uint256 public cantidad;

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
        /*for(uint i = 0; i < libros.length; i++) {
            require(libros[i].id != _id,"ID repetido");
        }*/
        require(
            existe[_id] == false,
            "ID repetido"
        );

        //Check de titulo vacio
        require(bytes(_titulo).length > 0,"Titulo vacio");

        /*libros.push(
            Libro(_id, _titulo, _paginas, true)
        );*/
        libros[_id] = Libro(_id, _titulo, _paginas, true);

        existe[_id] = true;

        cantidad++;
    }

    function contarElementos() public view ejecutadoPor returns(uint) {
        return cantidad;
    }

    function inactivarElemento(uint _id) public ejecutadoPor {
        require(existe[_id] == true, "Libro no existe");
        libros[_id].estado = false;
    }

    function mostrarActivos()public view ejecutadoPor{
        for(uint i = 0; i < cantidad + 100; i++) {
            if(existe[i] == true && libros[i].estado == true) {
                console.log("Libro activo", libros[i].id, libros[i].titulo);
            }
        }
    }

}