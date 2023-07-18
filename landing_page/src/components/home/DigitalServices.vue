<script setup>
const slides = [
  {
    id:1,
    title:'Grow Your Business',
    description:'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia',
    iconUrl:'/src/assets/images/icon-1.png',
    imageUrl:'/src/assets/images/business-1.jpg',
  },
  {
    id:2,
    title:'Grow Your Business',
    description:'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia',
    iconUrl:'/src/assets/images/icon-2.png',
    imageUrl:'/src/assets/images/business-2.jpg',
  },
  {
    id:3,
    title:'Grow Your Business',
    description:'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia',
    iconUrl:'/src/assets/images/icon-3.png',
    imageUrl:'/src/assets/images/business-3.jpg',
  },
  {
    id:4,
    title:'Grow Your Business',
    description:'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia',
    iconUrl:'/src/assets/images/icon-4.png',
    imageUrl:'/src/assets/images/business-4.jpg',
  },
  {
    id:5,
    title:'Grow Your Business',
    description:'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia',
    iconUrl:'/src/assets/images/icon-5.png',
    imageUrl:'/src/assets/images/business-5.jpg',
  },
]
const cards = [
  {
    id:1,
    title:'Grow Your Business',
    description:'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.',
    iconUrl:'/src/assets/images/icon-1.png',
    link:'https://www.facebook.com',
  },
  {
    id:2,
    title:'Build Products',
    description:'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.',
    iconUrl:'/src/assets/images/icon-2.png',
    link:'https://www.google.com',
  },
  {
    id:3,
    title:'Success Every Day',
    description:'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.',
    iconUrl:'/src/assets/images/icon-3.png',
    link:'https://www.youtube.com',
  },
  {
    id:4,
    title:'Bring Ideas to Life',
    description:'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.',
    iconUrl:'/src/assets/images/icon-4.png',
    link:'https://www.gmail.com',
  }
]
const packages = [
  {
    id:1,
    title:'Free',
    price:0,
    features:['There live the blind texts', 'Far far away behind the word', 'Far from the countries Vokalia and Consonantia']
  },{
    id:2,
    title:'Standard',
    price:19.99,
    features:['There live the blind texts', 'Far far away behind the word', 'Far from the countries Vokalia and Consonantia']
  },{
    id:3,
    title:'Premium',
    price:79.99,
    features:['There live the blind texts', 'Far far away behind the word', 'Far from the countries Vokalia and Consonantia']
  }
]
let slideImageUrl = slides[0].imageUrl
function setImage(id){
  const selectedSlide = slides.find((obj)=>{
    return obj.id == id
  })
  document.getElementById('show').src = selectedSlide.imageUrl
}
</script>

<template>
  <div class="container">
    <div class="row pt-100 pb-100">
      <div class="col-lg-5">
        <h6 class="text-primary text-uppercase fw-bold">Digital Services</h6>
        <h2 class="title">Selling Digital Services</h2>
        <p class="description text-secondary pr-100">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast</p>
        <ul class="service-list text-secondary">
          <li>There live the blind texts</li>
          <li>Far far away behind the word</li>
        </ul>
        <blockquote class="fst-italic blockquote pr-100">
          "Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia."
        </blockquote>

        <div class="pr-100">
          <div class="card mb-3" style="border: none">
            <div class="row g-0">
              <div class="col-md-3">
                <img src="/src/assets/images/person_1.jpg.webp" style="height: 90px; width: auto" class="img-fluid card-image" alt="...">
              </div>
              <div class="col-md-9">
                <div class="card-body ps-0">
                  <h5 class="card-title">James Anderson</h5>
                  <p class="card-text text-muted">Facebook, Product Lead</p>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
      <div class="col-lg-7">
        <img class="img-fluid" src="../../assets/images/dashboard.jpg.webp" alt="">
      </div>
    </div>
  </div>
  <section class="bg-light pt-100 pb-100">
    <div class="container">
      <div class="row">
        <div class="col-lg-7">
          <img :src="slideImageUrl" id="show" class="img-fluid" alt="">
        </div>
        <div class="col-lg-5">
          <div class="row slide-info" v-for="(slide,key) in slides" :key="key" @click="setImage(slide.id)">
            <div class="col-2"><img class="img-fluid p-1" :src="slide.iconUrl" alt="Icon"></div>
            <div class="col-10">
              <h5>{{ slide.title }}</h5>
              <p>{{ slide.description }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <div class="container pt-100 pb-100">
    <div class="row">
      <div class="col-lg-3" v-for="(card,key) in cards" :key="key">
        <div class="row">
          <div class="col-lg-3">
            <img :src="card.iconUrl" class="img-fluid" style="max-width: 100px; width: auto;" alt="">
          </div>
          <div class="col-lg-12 pt-20">
            <h5>{{ card.title }}</h5>
            <p class="text-muted">{{ card.description }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <section class="bg-light pt-100 pb-100">
    <div class="container">
      <div class="row">
        <div class="offset-1 col-10">
          <h2 class="title text-center">Pricing</h2>
          <p class="text-muted fw-bold text-center">Pricing for everyone. Choose your plan now!</p>
          <div class="row pt-70">
            <div class="col-lg-4 bg-light mb-3" v-for="(myPackage,key) in packages" :key="key">
              <div class="row me-2 ms-2">
                <div class="col-12 bg-white p-5 pb-2 ps-2 price-wrapper">
                  <h3 class="text-center">{{ myPackage.title }}</h3>
                  <p class="text-center price text-primary"><sup class="">$</sup> {{ myPackage.price }}</p>
                  <ul class="features mb-5">
                    <li class="text-muted mb-2 feature" v-for="(feature,key) in myPackage.features" :key="key">{{ feature }}</li>
                  </ul>
                </div>
                <div class="col-12 text-center bg-white pb-50 link-wrapper">
                  <a href="#" class="btn rounded-5 ps-5 pe-5" :class="key==1?'btn-primary':'btn-outline-primary'">Get Started</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section class="bg-white">
    <div class="container">
      <div class="row">
        <div class="col-12 pt-100 pb-30">
          <h2 class="title text-center">Advantage of using our products</h2>
          <p class="text-muted fw-bold text-center">Far from the countries Vokalia and Consonantia</p>
        </div>
        <div class="col-lg-6 mb-5" v-for="(card,key) in cards">
          <div class="row">
            <div class="col-1">
              <img class="img-fluid" :src="card.iconUrl" alt="Icon">
            </div>
            <div class="col-11">
              <h5>{{ card.title }}</h5>
              <p class="text-muted">{{ card.description }}</p>
              <a href="#" class="btn btn-sm btn-outline-primary">Learn More</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
*{
  font-family: 'Nunito',serif;
}
.title{
  font-size: 40px;
  font-weight: bold;
}
.description{
  font-size: large;
}

.service-list{
  list-style-type: none;
}

.service-list li::before{
  content: " ";
  display: inline-block;
  width: 10px;
  height: 10px;
  background-color: gray;
  margin-right: 10px;
}

.card-image{
  border-radius: 50%;
}
.slide-info{
  padding: 10px;
  border-radius: 5px;
}
.slide-info:hover{
  background-color: #ffffff;
  transition: all 0.5s;
  cursor: pointer;
}

.price{
  font-size: 35px;
}
.price sup{
  font-size: 20px;
}
.features{
  list-style-type: none;
}
.feature{
  margin-bottom: 20px;
}
.feature::before{
  content: " ";
  display: inline-block;
  width: 10px;
  height: 10px;
  background-color: gray;
  margin-right: 10px;
}

.price-wrapper{
  border-radius: 30px 30px 0 0;
}
.link-wrapper{
  border-radius: 0 0 30px 30px;
}
</style>
