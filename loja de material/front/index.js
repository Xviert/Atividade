const uri = 'http://localhost:3000/produto';
const cadastro = document.querySelector('#cadastro');
const corpo = document.querySelector('#corpo');
const total = document.querySelector('#total');
var valTotal = 0;

fetch(uri + '/listar', { method: 'GET' })
    .then(resp => resp.json())
    .then(data => montarTabela(data))
    .catch(err => console.error(err));

cadastro.addEventListener('submit', e => {
    e.preventDefault();

    const body = {
        "id": cadastro.id.value,
        "nome": cadastro.nome.value,
        "descricao": cadastro.descricao.value,
        "valor": cadastro.valor.value,
        "quantidade": cadastro.quantidade.value,
    }

    const options = {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
    };

    options.body = JSON.stringify(body);

    fetch(uri + '/criar', options)
        .then(resp => resp.status)
        .then(resp => {
            if (resp == 201) window.location.reload()
            else alert('Erro ao enviar dados')
        })
})

function montarTabela(vetor) {
    vetor.forEach(e => {
        let linha = document.createElement('tr')
        let col1 = document.createElement('td')
        let col2 = document.createElement('td')
        let col3 = document.createElement('td')
        let col4 = document.createElement('td')
        let col5 = document.createElement('td')
        let col6 = document.createElement('td')
        let col7 = document.createElement('td')
        let del = document.createElement('button')
        del.innerHTML = '[-]'
        del.setAttribute('onclick', `excluirProduto('${e.id}')`)
        col1.innerHTML = e.id
        col2.innerHTML = e.nome
        col3.innerHTML = e.descricao
        col4.innerHTML = e.valor
        col5.innerHTML = e.quantidade
        col7.appendChild(del)
        linha.appendChild(col1)
        linha.appendChild(col2)
        linha.appendChild(col3)
        linha.appendChild(col4)
        linha.appendChild(col5)
        linha.appendChild(col6)
        linha.appendChild(col7)
        corpo.appendChild(linha)
        // valTotal += e.valor
        // total.value = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(valTotal)
    });
}

function excluirProduto(id) {
    if (confirm('Deseja mesmo excluir o produto?')) {
        fetch(uri + '/excluir/' + id, { method: 'DELETE' })
            .then(resp => resp.status)
            .then(resp => {
                if (resp == 204) window.location.reload()
                else alert('Erro ao enviar dados')
            })
    }
}