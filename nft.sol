
// SPDX-License-Identifier: AGPL-3.0

// Import the NFTokenMetadata and Ownable contracts from 0xcert
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token-metadata.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/ownership/ownable.sol";

// Define the NewNFT contract, inheriting from NFTokenMetadata and Ownable
contract NewNFT is NFTokenMetadata, Ownable {

    uint256 private contadorUnico = 0;

    constructor() {
        nftName = "Pampling";
        nftSymbol = "matic";
    }

    /**
     * @dev Acuña un nuevo NFT y lo asigna al destinatario especificado. 0x5BBD760A91f84AEafE2e09870a563b484aCfA742
     * @param _destinatario La dirección a la que se asignará el NFT. Si no se especifica, se asigna al propietario del contrato.
     * @param _uri La URI del token. https://ipfs.io/ipfs/QmeoHozGjjBhdVEXfxBiawPYM5gkuBn1abKZXmNMdz87n1?filename=3.png
     */
    function sellar(address _destinatario, string calldata _uri) external onlyOwner {
        uint256 tokenId = obtenerProximoTokenId();
        super._mint(_destinatario, tokenId);
        super._setTokenUri(tokenId, _uri);
    }

    /**
     * @dev Acuña un nuevo NFT, lo asigna al nuevo propietario y transfiere la propiedad del contrato al nuevo propietario.
     * @param newOwner La nueva dirección del propietario del NFT y del contrato.
     * @param _uri La URI del token.
     */
    function sellNewNFT(address newOwner, string calldata _uri) external onlyOwner {
    uint256 tokenId = obtenerProximoTokenId();
    super._mint(newOwner, tokenId);
    super._setTokenUri(tokenId, _uri);

    // No transferir la propiedad del contrato al nuevo propietario
    // super.transferOwnership(newOwner);
    
    // Agregar función de devolución de llamada para notificar al nuevo propietario.
    // emit NewNFTokenMinted(tokenId, newOwner);
}



    /**
     * @dev Obtiene el próximo ID único para un token.
     * @return El próximo ID único.
     */
    function obtenerProximoTokenId() private returns (uint256) {
        contadorUnico++;
        return contadorUnico;
    }
}
