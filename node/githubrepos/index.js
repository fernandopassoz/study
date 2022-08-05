
(async function() {
  const repos = await fetch("https://api.github.com/users/passoz/repos", { credentials: 'same-origin' })
  const data = await repos.json()
  data.map((item) => {
    console.log(item.name, item.created_at)
  })
})()
