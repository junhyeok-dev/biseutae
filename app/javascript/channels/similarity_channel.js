import consumer from "./consumer"

const similarityChannel = consumer.subscriptions.create("SimilarityChannel", {
  connected() {
    similarityChannel.send({ message: "Hello from the home controller!" })
  },

  disconnected() {

  },

  received(data) {
    document.body.insertAdjacentHTML("beforeend", data);
  }
});

export default similarityChannel