<template>
  <div class="container mx-auto">
    <div class="flex flex-col justify-center items-center">
      <div
        class="flex flex-initial w-80 dark:bg-gray-500 dark:text-gray-100 bg-indigo-100 border-2 border-current rounded-lg mt-6"
      >
        <table
          v-if="results.current !== 'Data Not Found'"
          class="min-w-full shadow-md rounded table-auto border-collapse border border-slate-400 border-current font-bold"
        >
          <tbody>
            <tr>
              <th
                class="p-4 text-left font-bold border border-slate-300 border-current"
              >
                🏏
              </th>
              <td v-if="results.title === 'Data Not Found'" class="p-4">
                {{ loading ? "Loading Match data" : "No Live Match" }}
              </td>
              <td v-else class="p-4 border border-slate-300 border-current">
                {{ loading ? "Loading Match data" : results.title }}
              </td>
            </tr>
            <tr>
              <th
                class="p-4 text-left font-bold border border-slate-300 border-current"
              >
                📊
              </th>
              <td v-if="results.update === 'Data Not Found'" class="p-4">
                {{ loading ? "Loading Match data" : "No Live Match" }}
              </td>
              <td v-else class="p-4 border border-slate-300 border-current">
                {{ loading ? "Loading Match data" : results.update }}
              </td>
            </tr>
            <tr>
              <th
                class="p-4 text-left font-bold border border-slate-300 border-current"
              >
                🔴
              </th>
              <td
                v-if="results.current === 'Data Not Found'"
                class="p-4 border border-slate-300 border-current"
              >
                {{ loading ? "Loading Match data" : "No Live Match" }}
              </td>
              <td v-else class="p-4 border border-slate-300 border-current">
                {{ loading ? "Loading Match data" : results.current }}
              </td>
            </tr>
            <tr>
              <th
                class="p-4 text-left font-bold border border-slate-300 border-current"
              >
                📉
              </th>
              <td
                v-if="results.runrate === 'Data Not Found'"
                class="p-4 border border-slate-300 border-current"
              >
                {{ loading ? "Loading Match data" : "No Live Match" }}
              </td>
              <td v-else class="p-4 border border-slate-300 border-current">
                {{ loading ? "Loading Match data" : results.runrate }}
              </td>
            </tr>
            <tr>
              <th
                class="p-4 text-left font-bold border border-slate-300 border-current"
              >
                ✊
              </th>
              <td
                v-if="results.batsman === 'Data Not Found'"
                class="p-4 border border-slate-300 border-current"
              >
                {{ loading ? "Loading Match data" : "No Live Match" }}
              </td>
              <td v-else class="p-4 border border-slate-300 border-current">
                {{ loading ? "Loading Match data" : results.batsman }}
                {{ loading ? "" : "\t" + "-" + "\t" + results.batsmanrun
                }}{{ loading ? "" : results.ballsfaced }}
              </td>
            </tr>
            <tr>
              <th
                class="p-4 text-left font-bold border border-slate-300 border-current"
              >
                ✊
              </th>
              <td
                v-if="results.bowler === 'Data Not Found'"
                class="p-4 border border-slate-300 border-current"
              >
                {{ loading ? "Loading Match data" : "No Live Match" }}
              </td>
              <td v-else class="p-4 border border-slate-300 border-current">
                {{ loading ? "Loading Match data" : results.bowler }}
                {{ loading ? " " : "\t" + "-" + "\t" + results.bowlerover }}
                {{ loading ? " " : "Over" + "\t" + results.bowlerruns }}
                {{
                  loading
                    ? " "
                    : "Run and" + "\t" + results.bowlerwickets + "\t" + "Wicket"
                }}
              </td>
            </tr>
            <tr>
              <th
                class="p-4 text-left font-bold border border-slate-300 border-current"
              >
                😳
              </th>
              <td
                v-if="results.lastwicket === 'Data Not Found'"
                class="p-4 border border-slate-300 border-current"
              >
                {{ loading ? "Loading Match data" : "No Live Match" }}
              </td>
              <td v-else class="p-4 border border-slate-300 border-current">
                {{ loading ? "Loading Match data" : results.lastwicket }}
              </td>
            </tr>
          </tbody>
        </table>
        <table
          v-else-if="results.current === 'Data Not Found'"
          class="min-w-full shadow-md rounded table-auto border-collapse border border-slate-400 border-current"
        >
          <tbody>
            <tr>
              <td class="p-4">
                <p class="text-center">
                  {{
                    loading
                      ? "Loading Match data"
                      : "🔴 Sorry Currently No Live Match"
                  }}
                </p>
              </td>
            </tr>
          </tbody>
        </table>
        <table
          v-else
          class="min-w-full shadow-md rounded table-auto border-collapse border border-slate-400 border-current"
        >
          <tbody>
            <tr>
              <td>
                <p class="text-center">
                  {{ loading ? "Loading Match data" : "🔴 No Live Match Data" }}
                </p>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <button
        v-if="results.current !== 'Data Not Found'"
        class="bg-yellow-400 text-black font-medium py-2 px-4 rounded-full mt-4"
        @click.prevent="getResult"
      >
        {{ loading ? "🔄 Updating Score" : "🔄 Refresh Score" }}
      </button>
      <form
        v-if="results.current === 'Data Not Found'"
        method="GET"
        class="m-5 flex"
      >
        <input
          id="match"
          name="match"
          class="w-15 text-center rounded-l-lg p-0 border-t mr-0 border-b border-l text-gray-800 border-gray-200 bg-white"
          placeholder="Enter Match ID"
          required
        />
        <button
          class="w-15 px-4 rounded-r-lg bg-purple-400 text-gray-800 font-bold p-4 uppercase border-purple-500 border-t border-b border-r"
        >
          Get Score
        </button>
      </form>
      <!-- component -->

      <div
        class="mt-5 w-3/5 bg-blue-100 rounded-lg shadow-sm p-5 border-dashed border border-blue-500 flex flex-col sm:flex-row justify-between items-center gap-2 sm:gap-0"
      >
        <div class="flex flex-col sm:flex-row justify-start items-center gap-4">
          <div class="text-center sm:text-left">
            <h1 class="text-gray-700 font-bold tracking-wider">
              Telegram Bot 🤖
            </h1>
            <p class="text-gray-500 font-semibold">
              Try our Live Cricket Score Telegram Bot - Free to Use
            </p>
          </div>
        </div>
        <div>
          <a
            href="https://telegram.me/livecriscore_bot"
            target="_blank"
            rel="nofollow noopener noreferrer"
            class="bg-blue-500 py-2 px-4 text-white font-bold rounded-md hover:bg-blue-600"
            >🤖 Start Bot</a
          >
        </div>
      </div>

      <div class="mt-6"></div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "ScoreHome",
  data() {
    return {
      results: {},
      loading: false,
      deferredPrompt: null,
    };
  },
  mounted() {
    this.getResult();
    this.captureEvent();
  },
  methods: {
    getResult() {
      this.loading = true;
      axios
        .get(
          "https://cricket-api.vercel.app/cri.php?url=https://m.cricbuzz.com/live-cricket-scores/" +
            this.$route.query.match
        )
        .then((response) => {
          this.results = response.data.livescore;
          this.loading = false;
        });
    },
    captureEvent() {
      window.addEventListener("beforeinstallprompt", (e) => {
        // ! Prevent Chrome 67 and earlier from automatically showing the prompt
        e.preventDefault();
        // Stash the event so it can be triggered later.
        this.deferredPrompt = e;
      });
    },
    clickCallback() {
      // Show the prompt
      this.deferredPrompt.prompt();
      // Wait for the user to respond to the prompt
      this.deferredPrompt.userChoice.then((choiceResult) => {
        if (choiceResult.outcome === "accepted") {
          // Call another function?
        }
        this.deferredPrompt = null;
      });
    },
  },
};
</script>
