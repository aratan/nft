# nft

### Propiedad del Contrato (Ownable):

El contrato NewNFT hereda de Ownable, lo que significa que hereda la funcionalidad para gestionar la propiedad del contrato.
El constructor del contrato NewNFT establece el nombre y el símbolo del NFT (nftName y nftSymbol), pero no realiza una transferencia de propiedad del contrato en el constructor.
Propiedad del NFT (NFTokenMetadata):

Cada vez que se llama a la función sellNewNFT, se crea un nuevo NFT con un ID único utilizando la función _mint y se asigna al nuevo propietario (newOwner) usando super._mint(newOwner, tokenId).
El NFT recién creado también tiene su URI establecido mediante super._setTokenUri(tokenId, _uri).
La propiedad del NFT se mantiene en instancias individuales del contrato, es decir, cada token creado por sellNewNFT tiene su propio propietario.
Con la línea comentada // super.transferOwnership(newOwner);, has evitado la transferencia de propiedad del contrato al nuevo propietario (newOwner). Por lo tanto:

La propiedad del contrato (Ownable) se mantiene en el contrato NewNFT.
La propiedad de cada NFT se asigna al propietario especificado en la función sellNewNFT.
En resumen, el contrato NewNFT mantiene la propiedad del contrato, y la propiedad de cada NFT creado se asigna al propietario especificado en la función sellNewNFT.
