<template>
  <section class="section">
    <div class="columns is-centered">
      <div class="column is-6">
        <div class="title">Sign up</div>

        <form method="post" @submit.prevent="submit">
          <b-field label="Username">
            <b-input type="text"
                     name="username"
                     v-model="username"
                     required></b-input>
          </b-field>

          <b-field label="Email">
            <b-input type="email"
                     name="email"
                     v-model="email"
                     required></b-input>
          </b-field>

          <b-field label="Password">
            <b-input type="password"
                     name="password"
                     v-model="password"
                     required></b-input>
          </b-field>

          <button type="submit" class="button is-success is-pulled-right">Submit</button>
        </form>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'IndexPage',
  components: {},
  data () {
    return {
      username: '',
      email: '',
      password: ''
    }
  },
  methods: {
    async submit () {
      try {
        const data = JSON.stringify({
          username: this.username,
          email: this.email,
          password: this.password
        })
        const res = await this.$axios.post('/auth/local/register', data, {
          headers: {
            'Content-Type': 'application/json'
          }
        })

        this.$buefy.toast.open({
          message: res.data.jwt,
          type: 'is-success',
          duration: 6000
        })
      } catch (e) {
        this.$buefy.toast.open({
          message: e,
          type: 'is-danger'
        })
      }
    }
  }
}
</script>
