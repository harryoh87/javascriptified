# Selecting all posts as required in front page
SELECT
  posts.id AS id,
  posts.title AS title,
  posts.date as date,
  posts.content AS content,
  categories.name AS category,
  CONCAT(users.first_name, ' ', users.last_name) AS author
    FROM posts
      INNER JOIN categories
        ON categories.id = posts.category_id
      INNER JOIN users
        ON users.id = posts.user_id
          ORDER BY posts.id DESC;

# Selection of all posts without the content (needed in CMS)
SELECT
  posts.id AS id,
  posts.title AS title,
  posts.date as date,
  categories.name AS category,
  CONCAT(users.first_name, ' ', users.last_name) AS author
    FROM posts
      INNER JOIN categories
        ON categories.id = posts.category_id
      INNER JOIN users
        ON users.id = posts.user_id
          ORDER BY posts.id DESC;
          
