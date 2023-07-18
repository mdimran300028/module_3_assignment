<script setup>
const items = [
  {title:'Members', number:59, unit:'M'},
  {title:'Team', number:14, unit:''},
]
</script>

<template>
<section class="">
  <div class="container">
    <div class="row pt-50 pb-100">
      <div class="col-lg-7">
        <img src="../../assets/images/about.svg" class="img-fluid" alt="">
      </div>
      <div class="col-lg-5">
        <h6 class="text-primary text-uppercase fw-bold">About</h6>
        <h2 class="title">About Us</h2>
        <p class="text-muted">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast</p>
        <p class="text-muted">Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>

        <ul class="list-items mt-5 ps-0">
          <li class="list-item">There live the blind texts</li>
          <li class="list-item">Far far away behind the word</li>
          <li class="list-item">Their place and supplies</li>
        </ul>

        <div class="row pt-20">
          <div class="col-lg-4 col-5" v-for="(item,key) in items" :key="key">
            <h1>{{ item.number }}{{ item.unit }}</h1>
            <p class="text-muted">{{ item.title }}</p>
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
.list-items{
  list-style-type: none;
}
.list-item{
  margin-bottom: 20px;
}
.list-item::before{
  content: " ";
  display: inline-block;
  width: 10px;
  height: 10px;
  background-color: dodgerblue;
  margin-right: 10px;
}
</style>
