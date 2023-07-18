<script setup>
const newses = [
  {
    id:1,
    name:'James',
    imageUrl:'/src/assets/images/person_1.jpg.webp',
    postDate:'Jun 14, 2020',
    topic:'Digital Service',
    duration:'4 min read',
    text:'Far far away behind the word mountains far from the countries'
  },
  {
    id:2,
    name:'Khan',
    imageUrl:'/src/assets/images/person_2.jpg.webp',
    postDate:'Jun 14, 2020',
    topic:'Digital Service',
    duration:'4 min read',
    text:'Far far away behind the word mountains far from the countries'
  },
  {
    id:3,
    name:'Rob',
    imageUrl:'/src/assets/images/person_3.jpg.webp',
    postDate:'Jun 14, 2020',
    topic:'Digital Service',
    duration:'4 min read',
    text:'Far far away behind the word mountains far from the countries'
  }
]
</script>

<template>

  <section class="bg-light pt-100 pb-100">
    <div class="container">
      <div class="row">
        <div class="col-12 pb-40">
          <h2 class="title text-center">Our News</h2>
          <p class="text-muted fw-bold text-center">Far from the countries Vokalia and Consonantia</p>
        </div>
        <div class="col-lg-4" v-for="(news,key) in newses" :key="key">
          <div class="row me-2 news">
            <div class="col-12 bg-white p-5 rounded">
              <div class="row pb-3">
                <div class="col-2">
                  <img :src="news.imageUrl" class="img-fluid card-image" alt="Thumbnail">
                </div>
                <div class="col-10">
                  <h5 class="fw-bold">Posted by {{ news.name }}</h5>
                  <h6 class="text-muted">{{ news.postDate }}</h6>
                </div>
              </div>
              <h6 class="text-muted">{{ news.topic }},{{ news.duration }}</h6>
              <h3 class="pt-20">{{ news.text }}</h3>
              <a href="#" class="link-primary">See Details</a>
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
.news:hover{
  cursor: pointer;
  transform: translateY(-20px);
  transition: all 0.5s;
}
.title{
  font-size: 40px;
  font-weight: bold;
}
.card-image{
  border-radius: 50%;
}
</style>
