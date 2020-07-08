<template>
  <div>
    <md-card>
      <md-card-media-cover>
        <md-card-media>
          <img v-bind:src="link" alt="Skyscraper" />
        </md-card-media>

        <md-card-area>
          <md-card-header>
            <span class="md-title" style="color: black"
              >Without text background</span
            >
            <span class="md-subhead" style="color: black"
              >I bet you can't read this</span
            >
          </md-card-header>

          <md-card-actions>
            <md-button style="color: black">Neither this</md-button>
            <md-button style="color: black">Or this</md-button>
          </md-card-actions>
        </md-card-area>
      </md-card-media-cover>
    </md-card>
    <md-card>
      <md-card-media-cover>
        <md-card-media>
          <img v-bind:src="link2" alt="Skyscraper" />
        </md-card-media>

        <md-card-area>
          <md-card-header>
            <span class="md-title" style="color: black"
              >Without text background</span
            >
            <span class="md-subhead" style="color: black"
              >I bet you can't read this</span
            >
          </md-card-header>

          <md-card-actions>
            <md-button style="color: black">Neither this</md-button>
            <md-button style="color: black">Or this</md-button>
          </md-card-actions>
        </md-card-area>
      </md-card-media-cover>
    </md-card>
    <md-card>
      <md-card-media-cover>
        <md-card-media>
          <img v-bind:src="link" alt="Skyscraper" />
        </md-card-media>

        <md-card-area>
          <md-card-header>
            <span class="md-title" style="color: black"
              >Without text background</span
            >
            <span class="md-subhead" style="color: black"
              >I bet you can't read this</span
            >
          </md-card-header>

          <md-card-actions>
            <md-button style="color: black">Neither this</md-button>
            <md-button style="color: black">Or this</md-button>
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
      ratio: `${window.innerWidth}:${window.innerHeight + 12}`,
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
