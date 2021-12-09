import { Fetcher } from '../helpers/fetcher.js'
import { modalShow, preventDefault } from '../modal.js'

const fetcher = new Fetcher();

const containerEspectaculos = document.getElementById('container-espectaculos');


//Funcion para crar un elemento
//https://www.w3schools.com/jsref/met_document_createelement.asp
//
//herramientas usadas:
//touch events: https://developer.mozilla.org/en-US/docs/Web/API/Touch_events
//scrollIntoView: https://developer.mozilla.org/en-US/docs/Web/API/Element/scrollIntoView
//find: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find

const newEspectaculo = (espectaculo) => {
    
//    NOTA
//    -   tengo un atributo personalizado "key" el cual sirve como identificador de los atributos de cada card
//        Con esto se hace posible que al aplicar eventos, estos se apliquen en los elementos corresponidentes de determinada card
    
    const col = document.createElement('div')
    col.setAttribute('class', 'col-md-6 col-lg-4')
    
//    const card_container = document.createElement('div')
//    card_container.setAttribute('class', 'card-espectaculo-container')
//    
    const card = document.createElement('div')
    card.setAttribute('class', 'card text-white bg-dark shadow')
    card.setAttribute('key', espectaculo.name)
    
    const card_header = document.createElement('div')
    card_header.setAttribute('class', 'card-header')
    
    const card_img_container = document.createElement('div')
    card_img_container.setAttribute('class', 'card-img-container')
    
    const card_img = document.createElement('img')
    card_img.setAttribute('class', 'card-img-top')
    
    const img = espectaculo.img !== undefined ? espectaculo.img : 'img/espectaculos/espectaculo_default.png'
    
    card_img.setAttribute('src', img)
    card_img.setAttribute('alt', espectaculo.name)
    
    const card_body = document.createElement('div')
    card_body.setAttribute('class', 'card-body card-espectaculo')
    card_body.setAttribute('key', espectaculo.name)
    
    const card_title = document.createElement('h5')
    card_title.setAttribute('class', 'card-title text-truncate')
    card_title.textContent = espectaculo.name
    
    const card_text_contanier = document.createElement('div')
    card_text_contanier.setAttribute('class', 'card-text-container')
    
    const card_text = document.createElement('p')
    card_text.setAttribute('class', 'card-text')
    card_text.textContent = espectaculo.descripcion
    
    const dateText = document.createElement('p')
    dateText.setAttribute('class', 'dateText')
    
    const just_date = espectaculo.fechaRegistro.split(' ')
    const date = just_date[0].split('-')
    dateText.textContent = `${date[2]}/${date[1]}/${date[0]}`
    
//    const link_container = document.createElement('div')
//    link_container.setAttribute('class', 'link-container')
    
    const link = document.createElement('a')
    link.setAttribute('class', 'card-link text-success show-espectaculo')
    link.setAttribute('href', '#')
    link.setAttribute('key', espectaculo.name)
    link.textContent = 'Ver Mas'
    
    containerEspectaculos.appendChild(col)
    col.appendChild(card)
    card.appendChild(card_header)
    card_header.appendChild(card_img_container)
    card_img_container.appendChild(card_img)
    card_header.appendChild(card_title)
    card.appendChild(card_body)
    card_body.appendChild(card_text_contanier)
    card_text_contanier.appendChild(card_text)
    card_body.appendChild(dateText)
    card_body.appendChild(link)
    
    return {card, link ,card_body}
}

//en esta funcion creo los elementos y manejo la manipulacion de los mismos
//ya que al ser elementos creados con js, no son reconocidos por el DOM de html.
//por ende, no se pueden llamar con los metodos de document (por ejemplo, document.getElementById)
// y hay que buscar la manera de poder trabajar con ellos
//en frameworks por VUE o React estos problemas son resueltos, tanto el craer elementos (jsx), como su manipulacion.
//https://www.w3schools.com/jsref/met_document_getelementbyid.asp
//https://reactjs.org/docs/introducing-jsx.html

const createEspectaculos = async (nombre_plataforma) => {
    const links = []// array para guardar los elementos links (Ver Mas)
    const cards = []// array para guardar el contenedor de cada espectaculo
    const card_bodys = []// array para guardar el cuerpo del texto de cada espectaculo
    removeChilds(containerEspectaculos)
    
    const especs = await fetcher.getEspectaculos(nombre_plataforma)//guardo los espectaculos
    especs.forEach(e => {
            const espectaculo = newEspectaculo(e)// creo un elemento por cada espectaculo
            espectaculo.card.classList.add('heightcard')
            links.push(espectaculo.link)
            cards.push(espectaculo.card)
            card_bodys.push(espectaculo.card_body)
     })
    links.forEach(link => {
        
        link.addEventListener('click', (e) => {
            e.preventDefault()
            const espec = especs.find(item => item.name === link.getAttribute('key'))
            modalShow(espec)
        })
    })
    
    cards.forEach(card => {
        card.addEventListener('click', (e) => {
            e.preventDefault()
            window.addEventListener('touchmove', preventDefault, {passive: false})//deshabilita el scroll cuando el modal esta abierto
            const espec = especs.find(item => item.name === card.getAttribute('key'))
            modalShow(espec)
            card.scrollIntoView({
                behavior: 'auto',
                block: 'center',
                inline: 'center'
            })
        })
    })
}

//funcion para limpiar el contenedor padre de los espectaculos.
//Cada vez que se agregan elementos, se hace una peticion y se traen todos los elementos
// los que ya estaban y los nuevos, haciendo que el contendor padre guarde los que ya tenia mas los de la nueva peticion.
//Generando que se repitan elementos.
//Para ello, antes de agregar (o en mi caso elegir otra plataforma) elementos, vacio al contenedor padre
const removeChilds = (parent) => {
    while(parent.firstChild) {
        parent.removeChild(parent.firstChild)
    }
}

export { createEspectaculos }
