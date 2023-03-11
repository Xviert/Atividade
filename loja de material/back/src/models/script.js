class Produto {

    constructor(m) {
        this.id = m.id
        this.nome = m.nome
        this.descricao = m.descricao
        this.valor = m.valor
        this.quantidade = m.quantidade
    }
    
    create() {
        return `INSERT INTO Produto VALUE('${this.id}','${this.nome}','${this.descricao}',${this.valor},${this.quantidade})`
    }
    
    read() {
        if (this.id == undefined)
            return `SELECT * FROM Produto`
        else
            return `SELECT * FROM Produto WHERE id = '${this.id}'`
    }
    
    update() {
        return `UPDATE Produto SET nome = '${this.nome}', descricao = '${this.descricao}', valor = ${this.valor}, quantidade = ${this.quantidade} WHERE id = '${this.id}'`;
    }
    
    delete() {
        return `DELETE FROM Produto WHERE id = '${this.id}'`
    }
}
    
module.exports = Produto