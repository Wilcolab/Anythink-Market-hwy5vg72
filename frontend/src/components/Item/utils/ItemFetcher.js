import agent from "../../../agent";


export async function getItemAndComments(id) {
  // Start both asynchronous requests simultaneously
  const [itemPromise, commentsPromise] = [
    agent.Items.get(id),
    agent.Comments.forItem(id),
  ];

  // Wait for both promises to resolve using Promise.all
  const [item, comments] = await Promise.all([itemPromise, commentsPromise]);

  return [item, comments];
}
