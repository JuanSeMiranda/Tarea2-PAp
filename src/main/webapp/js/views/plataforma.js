import { Fetcher } from '../helpers/fetcher.js'
import { createEspectaculos } from '../views/espectaculo.js'

const fetcher = new Fetcher();

//metodos usados:
//forEach: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach
//classList: https://www.w3schools.com/jsref/prop_element_classlist.asp
//addEventListener: https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener
//innerText: https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/innerText

const dropPlataformas = document.getElementById('dropPlataformas');
const dropdownMenuButton = document.getElementById('dropdownMenuButton')
const containerEspectaculos = document.getElementById('container-espectaculos');
const seleccion_plataforma = document.getElementById('seleccion-plataforma');

//trae las plataformas desde la base de datos y crea los <a href="#" class="dropdown-item"></a>
const setPlataformas = async () => {
    dropdownMenuButton.innerText = 'Cargando'
    
    const plataformas = await fetcher.getPlataformas()
    const lista = []
    if (plataformas[0].error !== undefined) {
        throw plataformas[0].error
    }
    
    plataformas.forEach(item => {
        const aelement = document.createElement('a')
        aelement.setAttribute('href', '#');
        aelement.setAttribute('class', 'dropdown-item')
        aelement.textContent = item.name
        dropPlataformas.append(aelement)
        lista.push(aelement)
    })
 
    
    return lista
}

//llamo a los espectaculos y le agrego un aanimacion al contenedor padre
//animate: https://developer.mozilla.org/en-US/docs/Web/API/Element/animate

const showEspectaculosPlataforma = (item) => {
    createEspectaculos(item.innerText)
    containerEspectaculos.animate(
        [
            { opacity: 0, top: '10px' },
            { opacity: 1, top: '0px' }
        ], 
        {
            duration: 500
        }
    );
    setTimeout(() => {
        containerEspectaculos.classList.add('opacity_one')
    }, 500)
}

//una vez seteados, creo un evento para esos elementos
setPlataformas()
.then(res => {
    //en las dos primeras lineas recargo los elementos de la primera plataforma
    //para que aparezcan al ingresar a la pagina
    dropdownMenuButton.innerText = res[0].innerText
    showEspectaculosPlataforma(res[0])
    
    res.forEach(item => {
        item.addEventListener('click', () => {
            showEspectaculosPlataforma(item)
        })
    })
})
.catch( err => {
    console.log(err)
    seleccion_plataforma.style.visibility = 'hidden'
    container.classList.add('empty')
    const errorP = document.createElement('p')
    errorP.setAttribute('class', 'error-espectaculos')
    errorP.textContent = err
    container.appendChild(errorP)
})