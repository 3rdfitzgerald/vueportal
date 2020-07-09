<template>
  <div class="page-container">
    <md-app style="min-height: 100vh">
      <md-app-toolbar class="md-primary">
        <md-button
          class="md-icon-button"
          @click="toggleMenu"
          v-if="!menuVisible"
        >
          <md-icon>menu</md-icon>
        </md-button>
        <span class="md-title">Products</span>
      </md-app-toolbar>

      <md-app-drawer :md-active.sync="menuVisible" md-persistent="full">
        <md-toolbar class="md-transparent" md-elevation="0">
          <span>Navigation</span>

          <div class="md-toolbar-section-end">
            <md-button class="md-icon-button md-dense" @click="toggleMenu">
              <md-icon>keyboard_arrow_left</md-icon>
            </md-button>
          </div>
        </md-toolbar>

        <md-list>
          <md-list-item to="/">
            <md-icon>move_to_inbox</md-icon>
            <span class="md-list-item-text">Home</span>
          </md-list-item>

          <md-list-item to="/about">
            <md-icon>send</md-icon>
            <span class="md-list-item-text">About</span>
          </md-list-item>

          <md-list-item to="/products">
            <md-icon>delete</md-icon>
            <span class="md-list-item-text">Products</span>
          </md-list-item>

          <md-list-item to="/analytics">
            <md-icon>error</md-icon>
            <span class="md-list-item-text">Analytics</span>
          </md-list-item>
        </md-list>
      </md-app-drawer>
      <md-app-content>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
          quibusdam, non molestias et! Earum magnam, similique, quo recusandae
          placeat dicta asperiores modi sint ea repudiandae maxime? Quae non
          explicabo, neque.
        </p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
          quibusdam, non molestias et! Earum magnam, similique, quo recusandae
          placeat dicta asperiores modi sint ea repudiandae maxime? Quae non
          explicabo, neque.
        </p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
          quibusdam, non molestias et! Earum magnam, similique, quo recusandae
          placeat dicta asperiores modi sint ea repudiandae maxime? Quae non
          explicabo, neque.
        </p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
          quibusdam, non molestias et! Earum magnam, similique, quo recusandae
          placeat dicta asperiores modi sint ea repudiandae maxime? Quae non
          explicabo, neque.
        </p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
          quibusdam, non molestias et! Earum magnam, similique, quo recusandae
          placeat dicta asperiores modi sint ea repudiandae maxime? Quae non
          explicabo, neque.
        </p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
          quibusdam, non molestias et! Earum magnam, similique, quo recusandae
          placeat dicta asperiores modi sint ea repudiandae maxime? Quae non
          explicabo, neque.
        </p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
          quibusdam, non molestias et! Earum magnam, similique, quo recusandae
          placeat dicta asperiores modi sint ea repudiandae maxime? Quae non
          explicabo, neque.
        </p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
          quibusdam, non molestias et! Earum magnam, similique, quo recusandae
          placeat dicta asperiores modi sint ea repudiandae maxime? Quae non
          explicabo, neque.
        </p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
          quibusdam, non molestias et! Earum magnam, similique, quo recusandae
          placeat dicta asperiores modi sint ea repudiandae maxime? Quae non
          explicabo, neque.
        </p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
          quibusdam, non molestias et! Earum magnam, similique, quo recusandae
          placeat dicta asperiores modi sint ea repudiandae maxime? Quae non
          explicabo, neque.
        </p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
          quibusdam, non molestias et! Earum magnam, similique, quo recusandae
          placeat dicta asperiores modi sint ea repudiandae maxime? Quae non
          explicabo, neque.
        </p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
          quibusdam, non molestias et! Earum magnam, similique, quo recusandae
          placeat dicta asperiores modi sint ea repudiandae maxime? Quae non
          explicabo, neque.
        </p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
          quibusdam, non molestias et! Earum magnam, similique, quo recusandae
          placeat dicta asperiores modi sint ea repudiandae maxime? Quae non
          explicabo, neque.
        </p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
          quibusdam, non molestias et! Earum magnam, similique, quo recusandae
          placeat dicta asperiores modi sint ea repudiandae maxime? Quae non
          explicabo, neque.
        </p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
          quibusdam, non molestias et! Earum magnam, similique, quo recusandae
          placeat dicta asperiores modi sint ea repudiandae maxime? Quae non
          explicabo, neque.
        </p>
      </md-app-content>
    </md-app>
  </div>
</template>

<script>
export default {
  name: "PersistentFull",
  data: () => ({
    menuVisible: false
  }),
  methods: {
    toggleMenu() {
      this.menuVisible = !this.menuVisible;
    }
  }
};
</script>

<style lang="scss" scoped>
.md-app {
  min-height: 350px;
  border: 1px solid rgba(#000, 0.12);
}

// Demo purposes only
.md-drawer {
  width: 230px;
  max-width: calc(100vw - 125px);
}
</style>
