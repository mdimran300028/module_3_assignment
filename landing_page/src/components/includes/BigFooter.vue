<script setup>
const socialLinks = [
  {icon:'/src/assets/images/social/instagram.webp',link:'https://www.instagram.com/'},
  {icon:'/src/assets/images/social/twitter.png',link:'https://twitter.com/'},
  {icon:'/src/assets/images/social/facebook.png',link:'https://facebook.com/'},
  {icon:'/src/assets/images/social/linkedin.png',link:'https://linkedin.com/'},
  {icon:'/src/assets/images/social/pinterest.png',link:'https://www.pinterest.com/'},
  {icon:'/src/assets/images/social/dribbble.png',link:'https://dribbble.com/'},
]
const projects = [
  {name:'La Lega Stadium',link:'#'},
  {name:'France Building',link:'#'},
  {name:'22 New Homes',link:'#'},
  {name:'Manage Center',link:'#'},
  {name:'Sports Hall',link:'#'}
]
const services = [
  {name:'Architect',link:'#'},
  {name:'Interior Design',link:'#'},
  {name:'Landscape Design',link:'#'},
  {name:'Consultancy',link:'#'},
]
const contact = [
    '43 Raymouth Rd. Baltemoer, London 3910',
    '+1(123)-456-7890',
    '+1(123)-456-7890',
    'info@mydomain.com',
]
</script>

<template>
<section class="bg-light pt-100 pb-50">
  <div class="container">
    <div class="row">
      <div class="col-lg-5 pe-5">
        <h5 class="mb-4">About Launch.</h5>
        <p class="text-muted">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
        <h5 class="pt-20">Connect</h5>
        <template v-for="(social,key) in socialLinks" :key="key">
          <a class="me-2" href="#">
            <img :src="social.icon" style="width: 30px; height: 30px" alt="Icon">
          </a>
        </template>
      </div>
      <div class="col-lg-2">
        <h5 class="mb-4">Projects</h5>
        <ul class="projects">
          <li v-for="(project,key) in projects" :key="key"><a :href="project.link" class="text-muted">{{ project.name }}</a></li>
        </ul>
      </div>
      <div class="col-lg-2">
        <h5 class="mb-4">Services</h5>
        <ul class="projects">
          <li v-for="(service,key) in services" :key="key"><a :href="service.link" class="text-muted">{{ service.name }}</a></li>
        </ul>
      </div>
      <div class="col-lg-3">
        <h5 class="mb-4">Contact</h5>
        <ul class="projects">
          <li v-for="(item,key) in contact" :key="key" class="text-muted">{{ item }}</li>
        </ul>
      </div>
    </div>
  </div>
</section>
</template>

<style scoped>
*{
  font-family: 'Nunito',serif;
}
.projects{
  list-style-type: none;
  padding-left: 0;
}
.projects li{
  margin-bottom: 8px;
}
.projects li a{
  text-decoration: none;
}
</style>
