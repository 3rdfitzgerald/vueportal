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
        <md-card>
          <md-card-header>
            <md-card-media md-big>
              <img src="../../src/assets/jfrog.png" alt="People" />
            </md-card-media>
            <div class="md-title" style="margin-top: -100px">Artifactory</div>
            <div class="md-subhead">Artifact Management</div>
          </md-card-header>

          <md-card-actions>
            <md-button>See More</md-button>
          </md-card-actions>

          <md-card-content>
            Artifactory serves as a repository for binary files or artifacts. It
            is used to maintain proper versioning across multiple users and
            builds in order to more fully automate the software distribution
            process.
          </md-card-content>
        </md-card>
        <br />
        <md-card>
          <md-card-header>
            <md-card-media>
              <img src="../../src/assets/azure.png" alt="People" />
            </md-card-media>
            <div class="md-title">Azure Devops</div>
            <div class="md-subhead">Code Management and Version Control</div>
          </md-card-header>

          <md-card-actions>
            <md-button>See More</md-button>
          </md-card-actions>

          <md-card-content>
            Azure DevOps is the evolution of VSTS (Visual Studio Team Services),
            offering capabilities such as project boards, testing and
            development pipelines, code repositories, artifacts, and countless
            marketplace extensions.
          </md-card-content>
        </md-card>
        <br />
        <md-card>
          <md-card-header>
            <md-card-media md-big>
              <img src="../../src/assets/bamboo.png" alt="People" />
            </md-card-media>
            <div class="md-title" style="margin-top: -100px">Bamboo</div>
            <div class="md-subhead">CI/CD Tool</div>
          </md-card-header>

          <md-card-actions>
            <md-button>See More</md-button>
          </md-card-actions>

          <md-card-content>
            Bamboo is a continuous integration and continuous deployment server.
            It can serve as an alternative to Jenkins.
          </md-card-content>
        </md-card>
        <br />
        <md-card>
          <md-card-header>
            <md-card-media md-big>
              <img src="../../src/assets/fisheye.png" alt="People" />
            </md-card-media>
            <div class="md-title" style="margin-top: -100px">Fisheye</div>
            <div class="md-subhead">Source Code Tool</div>
          </md-card-header>

          <md-card-actions>
            <md-button>See More</md-button>
          </md-card-actions>

          <md-card-content>
            Fisheye is used for browsing, indexing and searching source code.
          </md-card-content>
        </md-card>
        <br />
        <md-card>
          <md-card-header>
            <md-card-media md-big>
              <img src="../../src/assets/crucible.png" alt="People" />
            </md-card-media>
            <div class="md-title" style="margin-top: -100px">Crucible</div>
            <div class="md-subhead">Source Code Tool</div>
          </md-card-header>

          <md-card-actions>
            <md-button>See More</md-button>
          </md-card-actions>

          <md-card-content>
            Crucible is used for auditing and reviewing source code.
          </md-card-content>
        </md-card>
        <br />
        <md-card>
          <md-card-header>
            <md-card-media md-big>
              <img src="../../src/assets/jenkins.png" alt="People" />
            </md-card-media>
            <div class="md-title" style="margin-top: -30px">Jenkins</div>
            <div class="md-subhead">Automation Server, CI/CD Tool</div>
          </md-card-header>

          <md-card-actions>
            <md-button>See More</md-button>
          </md-card-actions>

          <md-card-content>
            Jenkins is a self-contained, open source automation server which can
            be used to automate all sorts of tasks related to building, testing,
            and delivering or deploying software.
          </md-card-content>
        </md-card>
        <br />
        <md-card>
          <md-card-header>
            <md-card-media md-big>
              <img src="../../src/assets/sonarQube.png" alt="People" />
            </md-card-media>
            <div class="md-title" style="margin-top: -100px">SonarQube</div>
            <div class="md-subhead">Application Health Monitoring</div>
          </md-card-header>

          <md-card-actions>
            <md-button>See More</md-button>
          </md-card-actions>

          <md-card-content>
            SonarQube provides the capability to not only show health of an
            application but also to highlight issues newly introduced. With a
            Quality Gate in place, you can fix the leak and therefore improve
            code quality systematically.
          </md-card-content>
        </md-card>
        <br />
        <md-card>
          <md-card-header>
            <md-card-media md-big>
              <img src="../../src/assets/specflow.png" alt="People" />
            </md-card-media>
            <div class="md-title" style="margin-top: -100px">SpecFlow</div>
            <div class="md-subhead">BDD Testing Framework</div>
          </md-card-header>

          <md-card-actions>
            <md-button>See More</md-button>
          </md-card-actions>

          <md-card-content>
            Specflow is an open source tool that allows users to define, manage,
            and automatically execute human-readable acceptance tests in .NET
            projects. It integrates with Visual Studio and the command line,
            and, as part of the Cucumber family, it utilizes
            <a
              href="https://confluence.markelcorp.com/display/DEVOPSQAAS/Gherkin"
              >Gherkin</a
            >.
          </md-card-content>
        </md-card>
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
