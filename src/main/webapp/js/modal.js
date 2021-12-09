const close_img_display = document.getElementById("close-img-display")
const close = document.getElementById("close")
const modal = document.querySelector('.modal-espectaculo');
const overlay = document.querySelector('.overlay')
const img_container = document.querySelector('.img-container')
const img_display = document.getElementById('img-display')
const info = document.getElementById('info')
const modal_title = document.getElementById('modal-title')
const modal_img = document.getElementById('modal-img')
const show_img = document.getElementById('show-img')
const description = document.getElementById('description')
const info_duracionMin = document.getElementById('duracionMin')
const info_cantMinEspectadores = document.getElementById('cantMinEspectadores')
const info_cantMaxEspectadores = document.getElementById('cantMaxEspectadores')
const info_url = document.getElementById('url')
const info_costo = document.getElementById('costo')
const info_fechaRegistro = document.getElementById('fechaRegistro')

function preventDefault(e) {
    e.preventDefault()
}

const modalShow = (espectaculo) => {
    let {
        name,
        descripcion,
        cantMinEspectadores,
        cantMaxEspectadores,
        duracionMin,
        url,
        costo,
        fechaRegistro,
        img
    } = espectaculo
    
    modal.classList.add('active')
    overlay.classList.add('active')
    
   modal_title.innerText = name

    if (img === undefined) {
        document.querySelector('.img-container').style.display = 'none'
    } else {
        document.querySelector('.img-container').style.display = 'block'
        modal_img.src = img
        show_img.src = img
    }
    
    modal_title.innerText = name
    description.innerText = descripcion
    info_duracionMin.innerText = duracionMin
    info_cantMinEspectadores.innerText = cantMinEspectadores
    info_cantMaxEspectadores.innerText = cantMaxEspectadores
    info_url.innerText = url
    info_costo.innerText = costo
    
    const just_date = fechaRegistro.split(' ')
    const date = just_date[0].split('-')
    info_fechaRegistro.innerText = `${date[2]}/${date[1]}/${date[0]}`
    
}

const modalClose = () => {
    if (img_display.classList.contains('active')) {
        img_display.classList.remove('active')
        
        overlay.style.background = 'rgba(0,0,0, .8)'
        overlay.style.zIndex = 100
        modal.style.zIndex = 110

        
    } else {
        modal.classList.remove('active')
        overlay.classList.remove('active')
    }
}

close.addEventListener('click', () => {
    modalClose()
    window.removeEventListener('touchmove', preventDefault, false)
    })

overlay.addEventListener('click', () => {
    modalClose()
    window.removeEventListener('touchmove', preventDefault, false)
})
    
img_container.addEventListener('click', () => {
    img_display.classList.add('active')
    overlay.style.zIndex = 90
    modal.style.zIndex = 80
    
    
    if (window.screen.width <= 1000) {
        overlay.style.background = '#000'
        overlay.style.height = '100vh'
    }
})

close_img_display.addEventListener('click', () => {
    img_display.classList.remove('active')
        
    overlay.style.background = 'rgba(0,0,0, .8)'
    overlay.style.zIndex = 100
    modal.style.zIndex = 110
    console.log('e')
})

export { modalShow, modalClose, preventDefault }
