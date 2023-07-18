<script setup>
const testimonials = [
  {
    id:1,
    quote:'Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia.',
    name:'James Anderson',
    designation:'Facebook, Product Lead',
    imageUrl:'/src/assets/images/person_1.jpg.webp'
  },
  {
    id:2,
    quote:'Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia.',
    name:'John Doe',
    designation:'Facebook, Product Lead',
    imageUrl:'/src/assets/images/person_2.jpg.webp'
  }
]
</script>

<template>
<section class="bg-light">
  <div class="container">
    <div class="row pt-100 pb-50">
      <div class="col-lg-3">
        <h6 class="text-primary text-uppercase fw-bold">Testimonial</h6>
        <h2 class="title">Our Customers Feedbck</h2>
        <button class="btn btn-sm btn-outline-primary me-2 py-2 fw-bold">Prev</button>
        <button class="btn btn-sm btn-outline-primary py-2 fw-bold">Next</button>
      </div>
      <div class="col-lg-9">
        <div class="row">
          <div class="col-lg-6" v-for="(testimonial,key) in testimonials">
            <blockquote class="fst-italic blockquote pr-100">"{{ testimonial.quote }}"</blockquote>
            <div class="pr-100">
              <div class="card mb-3 client" style="border: none">
                <div class="row g-0">
                  <div class="col-md-3">
                    <img :src="testimonial.imageUrl" style="height: 90px; width: auto" class="img-fluid card-image" alt="...">
                  </div>
                  <div class="col-md-9">
                    <div class="card-body">
                      <h5 class="card-title">{{ testimonial.name }}</h5>
                      <p class="card-text text-muted">{{ testimonial.designation }}</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12 text-center">
            <template v-for="(bullet,key) in testimonials">
              <span class="bullet" :class="bullet.id==1? 'bg-primary':'bg-secondary'" ></span>
            </template>
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
.client{
  background-color: transparent;
}
.card-image{
  border-radius: 50%;
}
.blockquote{
  font-size: 17px;
}
.bullet{
  display: inline-block;
  height: 10px;
  width: 10px;
  border-radius: 50%;
  margin-right: 15px;
}
</style>
