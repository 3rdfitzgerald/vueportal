<template>
  <div>
    <md-card>
      <md-card-media-cover>
        <md-card-media>
          <img src="../../src/assets/about.png" alt="Skyscraper" />
        </md-card-media>

        <md-card-area>
          <md-card-header>
            <h1
              class="md-title"
              style="color: white; padding-left: 42%; margin-bottom: 2%"
            >
              Lorem Ipsum About Text
            </h1>
          </md-card-header>

          <md-card-actions>
            <md-button
              class="md-raised md-primary"
              style="right: 47%; margin-bottom: 25%;"
              to="/about"
              >Learn More!</md-button
            >
          </md-card-actions>
        </md-card-area>
      </md-card-media-cover>
    </md-card>
    <md-card>
      <md-card-media-cover>
        <md-card-media>
          <img src="../../src/assets/products.png" alt="Skyscraper" />
        </md-card-media>

        <md-card-area>
          <md-card-header>
            <span
              class="md-title"
              style="color: black; padding-left: 42%; margin-bottom: 2%"
              >Lorem Ipsum Products Text</span
            >
          </md-card-header>

          <md-card-actions>
            <md-button
              class="md-raised md-primary"
              style="right: 47%; margin-bottom: 25%;"
              to="/products"
              >Learn More!</md-button
            >
          </md-card-actions>
        </md-card-area>
      </md-card-media-cover>
    </md-card>
    <md-card>
      <md-card-media-cover>
        <md-card-media>
          <img src="../../src/assets/analytics.jpg" alt="Skyscraper" />
        </md-card-media>

        <md-card-area>
          <md-card-header>
            <span
              class="md-title"
              style="color: black; padding-left: 42%; margin-bottom: 2%"
              >Lorem Ipsum Analytics Text</span
            >
          </md-card-header>

          <md-card-actions>
            <md-button
              class="md-raised md-primary"
              style="right: 47%; margin-bottom: 25%;"
              to="/analytics"
              >Learn More!</md-button
            >
          </md-card-actions>
        </md-card-area>
      </md-card-media-cover>
    </md-card>
  </div>
</template>

<script>
import "vue-material/dist/vue-material.min.css";
export default {
  name: "home",
  components: {
    //
  },
  data: function() {
    return {
      width: window.innerWidth,
      height: window.innerHeight,
      link: `http://placekitten.com/${window.innerWidth}/${window.innerHeight +
        12}`,
      link2: `http://placekitten.com/g/${
        window.innerWidth
      }/${window.innerHeight + 12}`,
      scrollPos: 0,
      canScroll: true
    };
  },
  mounted() {
    console.log(window.innerWidth);
    document.addEventListener("scroll", this.scrollHandler);
  },
  methods: {
    scrollHandler: function() {
      console.log(this.scrollPos);
      // if (this.canScroll) {
      //   this.canScroll = false;
      //   if (this.prevPos > window.scrollY) {
      //     this.prevPos = window.scrollY;
      //     window.scrollBy(0, -1 * window.innerHeight);
      //   } else {
      //     this.prevPos = window.scrollY;
      //     window.scrollBy(0, window.innerHeight);
      //   }
      //   setTimeout(() => {
      //     this.canScroll = true;
      //   }, 200);
      // }
    }
  }
};
</script>
