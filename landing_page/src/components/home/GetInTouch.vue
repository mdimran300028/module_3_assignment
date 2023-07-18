<script setup>
const contact = [
  {icon:'/src/assets/images/contact/address.png',text:'43 Raymouth Rd. Baltemoer, London 3910'},
  {icon:'/src/assets/images/contact/phone.png',text:'+1(123)-456-7890'},
  {icon:'/src/assets/images/contact/phone.png',text:'+1(123)-456-7890'},
  {icon:'/src/assets/images/contact/email.png',text:'info@mydomain.com'},
  {icon:'/src/assets/images/contact/globe.png',text:'https://Colorlib.com/'},
]
</script>

<template>
<div class="container">
  <div class="row pt-80 pb-80">
    <div class="col-12 pb-10">
      <h2 class="title text-center">Get In Touch</h2>
      <p class="text-muted fw-bold text-center">Far from the countries Vokalia and Consonantia</p>
    </div>
    <div class="col-lg-8">
      <div class="row g-2 mb-2">
        <div class="col-md-6">
          <div class="form-floating">
            <input type="text" class="form-control" id="firstName" placeholder="John" value="">
            <label for="firstName">First Name</label>
          </div>
        </div>

        <div class="col-md-6">
          <div class="form-floating">
            <input type="text" class="form-control" id="lastName" placeholder="Doe" value="">
            <label for="lastName">Last Name</label>
          </div>
        </div>

        <div class="col-md-12">
          <div class="form-floating">
            <input type="email" class="form-control" id="email" placeholder="abcd@xyz.com" value="">
            <label for="email">Email Address</label>
          </div>
        </div>

        <div class="col-md-12">
          <div class="form-floating">
            <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
            <label for="floatingTextarea2">Comments</label>
          </div>
        </div>
      </div>
      <button class="btn btn-sm btn-primary text-uppercase p-2 pe-5 ps-5 rounded-5">Send Message</button>
    </div>
    <div class="col-lg-4">
      <h4 class="mb-3">Contact Info</h4>
      <p v-for="(item,key) in contact" :key="key">
        <img :src="item.icon" class="me-2" alt="icon" style="width: 20px; height: 20px">
        {{ item.text }}
      </p>
    </div>
  </div>
</div>
</template>

<style scoped>
*{
  font-family: 'Nunito',serif;
}

.title{
  font-size: 40px;
  font-weight: bold;
}
</style>
