USE javascriptified;

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;

# ROLES
CREATE TABLE roles
(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(15) NOT NULL
);

# USERS
CREATE TABLE users
(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  role_id INTEGER NOT NULL,
  email VARCHAR(50) NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  password VARCHAR(32) NOT NULL,
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

# CATEGORIES
CREATE TABLE categories
(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  parent_id INTEGER NOT NULL,
  name VARCHAR(30) NOT NULL,
  description TEXT,
  count INTEGER NOT NULL
);

# POSTS
CREATE TABLE posts
(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  user_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  title VARCHAR(50) NOT NULL,
  date DATETIME NOT NULL,
  content TEXT,
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (category_id) REFERENCES categories (id)
);

# COMMENTS
CREATE TABLE comments
(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  post_id INTEGER NOT NULL,
  date DATETIME NOT NULL,
  content TEXT NOT NULL,
  FOREIGN KEY(post_id) REFERENCES posts (id)
);

# INITAL DATA SET
INSERT INTO roles (name) VALUES ('administrator');
INSERT INTO roles (name) VALUES ('contributor');
INSERT INTO roles (name) VALUES ('commenter');
INSERT INTO roles (name) VALUES ('visitor');
INSERT INTO roles (name) VALUES ('intruder');

INSERT INTO users (role_id, email, first_name, last_name, password) VALUES (1, 'hyunseokohh@gmail.com', 'Hyun Seok', 'Oh', MD5('12345'));
INSERT INTO users (role_id, email, first_name, last_name, password) VALUES (2, 'ohh@umail.iu.edu', 'Harry', 'Oh', MD5('harryoh'));
INSERT INTO users (role_id, email, first_name, last_name, password) VALUES (3, 'jimjohnson23@hotmail.com', 'Jim', 'Johnson', MD5('jimmyjohns'));
INSERT INTO users (role_id, email, first_name, last_name, password) VALUES (4, 'hyunsuccc@hotmail.com', 'David', 'Kim', MD5('davidkim'));

INSERT INTO categories (parent_id, name, description, count) VALUES (0, 'Programming', 'All things programming', 0);
INSERT INTO categories (parent_id, name, description, count) VALUES (0, 'Book Reviews', 'All about my favorite books', 0);

INSERT INTO posts (user_id, title, date, category_id, content) VALUES (1, 'Lorem ipsum dolor', '2011-06-03 12:15:21', 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin metus ipsum, porta ut tempus nec, laoreet a est. Vivamus eget lorem nulla. Vivamus dapibus velit nec libero pharetra congue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam tellus ligula, interdum nec pulvinar sit amet, fermentum eget lorem. Nunc id odio id metus lobortis interdum. Aenean elit mauris, ornare non ullamcorper et, fermentum rutrum enim. Nullam risus leo, rutrum sed lacinia eu, dignissim congue nisl. Sed vel lectus sit amet ligula ullamcorper fermentum. Etiam elementum fermentum odio sit amet pretium. Integer a nisl nec nisi placerat rutrum. Duis ac mi rutrum metus lobortis hendrerit nec sed est. Pellentesque condimentum dui at nunc interdum sed viverra enim auctor. Aenean feugiat, sapien posuere hendrerit vehicula, tortor dui pretium metus, vitae consequat nibh augue nec turpis. Donec lobortis tincidunt tristique. Duis sit amet ligula arcu, et hendrerit nunc.');
INSERT INTO posts (user_id, title, date, category_id, content) VALUES (1, 'Duis viverra lobortis ultrices', '2011-06-17 12:35:21', 2, 'Duis viverra lobortis ultrices. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer risus urna, sollicitudin et facilisis eu, porttitor non lacus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi eu eleifend massa. Aliquam sit amet pharetra ipsum. Praesent vulputate viverra turpis, quis tincidunt massa laoreet a. Praesent vel dictum dui. Vestibulum nec neque ac ligula sollicitudin fermentum eu et mauris. Vestibulum varius euismod ligula, at tempor metus tincidunt at. Nam pharetra est eu dui interdum ac condimentum nisi vestibulum. Integer sed purus egestas elit lacinia tempus. Nullam sit amet diam et nunc laoreet vehicula. Mauris sit amet enim ante. Morbi lacinia nibh a dolor feugiat feugiat.');
INSERT INTO posts (user_id, title, date, category_id, content) VALUES (1, 'Curabitur euismod', '2011-06-30 12:25:21', 1, 'Curabitur euismod nunc a tellus semper gravida. Praesent egestas porttitor consectetur. Fusce sed lectus eget justo iaculis consectetur ac non tellus. Vestibulum condimentum ullamcorper sollicitudin. Integer vitae sem dui. Curabitur pharetra varius massa et bibendum. Duis vel lobortis erat. Integer euismod urna non dui eleifend ac pellentesque lorem fringilla. Curabitur porttitor feugiat tincidunt. Quisque ultrices, turpis nec consequat lacinia, nibh turpis porta tortor, et blandit nibh sapien in purus.');
INSERT INTO posts (user_id, title, date, category_id, content) VALUES (1, 'Suspendisse fermentum quam', '2011-07-01 12:12:21', 1, 'Nam libero magna, sagittis sed tempor a, euismod et nisi. Suspendisse vitae felis elit, nec scelerisque purus. Pellentesque dignissim, quam in venenatis porttitor, lacus turpis tempus risus, quis tristique tellus est vitae tellus. Sed volutpat sollicitudin dapibus. Donec eleifend gravida eros id iaculis. Sed vehicula commodo nulla, sed tristique massa condimentum a. Phasellus ante magna, porttitor ac venenatis ut, ullamcorper id ante. Duis rutrum sem a tellus viverra sit amet cursus dui accumsan. Praesent dolor purus, scelerisque a placerat at, venenatis eget nisl. In dictum, lectus vitae sollicitudin egestas, felis urna pellentesque eros, eu rhoncus diam nulla sed odio. Suspendisse id aliquet lorem.');
INSERT INTO posts (user_id, title, date, category_id, content) VALUES (1, 'Curabitur euismod', '2011-07-02 12:14:21', 2, 'Suspendisse fermentum quam vel neque molestie congue. Aliquam eget felis eu nunc facilisis volutpat ut eu sapien. Donec bibendum dui id erat vehicula accumsan. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu purus dui, nec placerat massa. Pellentesque vehicula convallis tortor ac blandit. Proin vulputate, tortor a luctus bibendum, sapien nisi scelerisque magna, at pulvinar nunc dui vitae lectus. Donec non diam odio, vitae sollicitudin tellus. Quisque dignissim neque sed sem ultricies sollicitudin.');
INSERT INTO posts (user_id, title, date, category_id, content) VALUES (1, 'Duis viverra lobortis ultrices', '2011-08-30 11:45:21', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin metus ipsum, porta ut tempus nec, laoreet a est. Vivamus eget lorem nulla. Vivamus dapibus velit nec libero pharetra congue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam tellus ligula, interdum nec pulvinar sit amet, fermentum eget lorem. Nunc id odio id metus lobortis interdum. Aenean elit mauris, ornare non ullamcorper et, fermentum rutrum enim. Nullam risus leo, rutrum sed lacinia eu, dignissim congue nisl. Sed vel lectus sit amet ligula ullamcorper fermentum. Etiam elementum fermentum odio sit amet pretium. Integer a nisl nec nisi placerat rutrum. Duis ac mi rutrum metus lobortis hendrerit nec sed est. Pellentesque condimentum dui at nunc interdum sed viverra enim auctor. Aenean feugiat, sapien posuere hendrerit vehicula, tortor dui pretium metus, vitae consequat nibh augue nec turpis. Donec lobortis tincidunt tristique. Duis sit amet ligula arcu, et hendrerit nunc.');
INSERT INTO posts (user_id, title, date, category_id, content) VALUES (1, 'Curabitur euismod', '2011-08-30 12:21:21', 2, 'Duis viverra lobortis ultrices. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer risus urna, sollicitudin et facilisis eu, porttitor non lacus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi eu eleifend massa. Aliquam sit amet pharetra ipsum. Praesent vulputate viverra turpis, quis tincidunt massa laoreet a. Praesent vel dictum dui. Vestibulum nec neque ac ligula sollicitudin fermentum eu et mauris. Vestibulum varius euismod ligula, at tempor metus tincidunt at. Nam pharetra est eu dui interdum ac condimentum nisi vestibulum. Integer sed purus egestas elit lacinia tempus. Nullam sit amet diam et nunc laoreet vehicula. Mauris sit amet enim ante. Morbi lacinia nibh a dolor feugiat feugiat.');
INSERT INTO posts (user_id, title, date, category_id, content) VALUES (1, 'Duis viverra lobortis ultrices', '2011-09-12 12:14:21', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin metus ipsum, porta ut tempus nec, laoreet a est. Vivamus eget lorem nulla. Vivamus dapibus velit nec libero pharetra congue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam tellus ligula, interdum nec pulvinar sit amet, fermentum eget lorem. Nunc id odio id metus lobortis interdum. Aenean elit mauris, ornare non ullamcorper et, fermentum rutrum enim. Nullam risus leo, rutrum sed lacinia eu, dignissim congue nisl. Sed vel lectus sit amet ligula ullamcorper fermentum. Etiam elementum fermentum odio sit amet pretium. Integer a nisl nec nisi placerat rutrum. Duis ac mi rutrum metus lobortis hendrerit nec sed est. Pellentesque condimentum dui at nunc interdum sed viverra enim auctor. Aenean feugiat, sapien posuere hendrerit vehicula, tortor dui pretium metus, vitae consequat nibh augue nec turpis. Donec lobortis tincidunt tristique. Duis sit amet ligula arcu, et hendrerit nunc.');
INSERT INTO posts (user_id, title, date, category_id, content) VALUES (1, 'Suspendisse fermentum quam', '2011-09-18 12:35:21', 2, 'Duis viverra lobortis ultrices. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer risus urna, sollicitudin et facilisis eu, porttitor non lacus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi eu eleifend massa. Aliquam sit amet pharetra ipsum. Praesent vulputate viverra turpis, quis tincidunt massa laoreet a. Praesent vel dictum dui. Vestibulum nec neque ac ligula sollicitudin fermentum eu et mauris. Vestibulum varius euismod ligula, at tempor metus tincidunt at. Nam pharetra est eu dui interdum ac condimentum nisi vestibulum. Integer sed purus egestas elit lacinia tempus. Nullam sit amet diam et nunc laoreet vehicula. Mauris sit amet enim ante. Morbi lacinia nibh a dolor feugiat feugiat.');
INSERT INTO posts (user_id, title, date, category_id, content) VALUES (1, 'Duis viverra lobortis', '2011-09-22 12:25:21', 1, 'Curabitur euismod nunc a tellus semper gravida. Praesent egestas porttitor consectetur. Fusce sed lectus eget justo iaculis consectetur ac non tellus. Vestibulum condimentum ullamcorper sollicitudin. Integer vitae sem dui. Curabitur pharetra varius massa et bibendum. Duis vel lobortis erat. Integer euismod urna non dui eleifend ac pellentesque lorem fringilla. Curabitur porttitor feugiat tincidunt. Quisque ultrices, turpis nec consequat lacinia, nibh turpis porta tortor, et blandit nibh sapien in purus.');
INSERT INTO posts (user_id, title, date, category_id, content) VALUES (1, 'Curabitur euismod', '2011-10-22 12:12:21', 1, 'Nam libero magna, sagittis sed tempor a, euismod et nisi. Suspendisse vitae felis elit, nec scelerisque purus. Pellentesque dignissim, quam in venenatis porttitor, lacus turpis tempus risus, quis tristique tellus est vitae tellus. Sed volutpat sollicitudin dapibus. Donec eleifend gravida eros id iaculis. Sed vehicula commodo nulla, sed tristique massa condimentum a. Phasellus ante magna, porttitor ac venenatis ut, ullamcorper id ante. Duis rutrum sem a tellus viverra sit amet cursus dui accumsan. Praesent dolor purus, scelerisque a placerat at, venenatis eget nisl. In dictum, lectus vitae sollicitudin egestas, felis urna pellentesque eros, eu rhoncus diam nulla sed odio. Suspendisse id aliquet lorem.');
INSERT INTO posts (user_id, title, date, category_id, content) VALUES (1, 'Duis viverra lobortis ultrices', '2011-10-24 12:14:21', 2, 'Suspendisse fermentum quam vel neque molestie congue. Aliquam eget felis eu nunc facilisis volutpat ut eu sapien. Donec bibendum dui id erat vehicula accumsan. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu purus dui, nec placerat massa. Pellentesque vehicula convallis tortor ac blandit. Proin vulputate, tortor a luctus bibendum, sapien nisi scelerisque magna, at pulvinar nunc dui vitae lectus. Donec non diam odio, vitae sollicitudin tellus. Quisque dignissim neque sed sem ultricies sollicitudin.');
INSERT INTO posts (user_id, title, date, category_id, content) VALUES (1, 'Suspendisse fermentum quam', '2011-11-23 12:45:21', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin metus ipsum, porta ut tempus nec, laoreet a est. Vivamus eget lorem nulla. Vivamus dapibus velit nec libero pharetra congue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam tellus ligula, interdum nec pulvinar sit amet, fermentum eget lorem. Nunc id odio id metus lobortis interdum. Aenean elit mauris, ornare non ullamcorper et, fermentum rutrum enim. Nullam risus leo, rutrum sed lacinia eu, dignissim congue nisl. Sed vel lectus sit amet ligula ullamcorper fermentum. Etiam elementum fermentum odio sit amet pretium. Integer a nisl nec nisi placerat rutrum. Duis ac mi rutrum metus lobortis hendrerit nec sed est. Pellentesque condimentum dui at nunc interdum sed viverra enim auctor. Aenean feugiat, sapien posuere hendrerit vehicula, tortor dui pretium metus, vitae consequat nibh augue nec turpis. Donec lobortis tincidunt tristique. Duis sit amet ligula arcu, et hendrerit nunc.');
INSERT INTO posts (user_id, title, date, category_id, content) VALUES (1, 'Lorem viverra ultrices', '2011-11-24 12:21:21', 2, 'Duis viverra lobortis ultrices. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer risus urna, sollicitudin et facilisis eu, porttitor non lacus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi eu eleifend massa. Aliquam sit amet pharetra ipsum. Praesent vulputate viverra turpis, quis tincidunt massa laoreet a. Praesent vel dictum dui. Vestibulum nec neque ac ligula sollicitudin fermentum eu et mauris. Vestibulum varius euismod ligula, at tempor metus tincidunt at. Nam pharetra est eu dui interdum ac condimentum nisi vestibulum. Integer sed purus egestas elit lacinia tempus. Nullam sit amet diam et nunc laoreet vehicula. Mauris sit amet enim ante. Morbi lacinia nibh a dolor feugiat feugiat.');
INSERT INTO posts (user_id, title, date, category_id, content) VALUES (1, 'Duis viverra lobortis', '2012-01-01 12:14:21', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin metus ipsum, porta ut tempus nec, laoreet a est. Vivamus eget lorem nulla. Vivamus dapibus velit nec libero pharetra congue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam tellus ligula, interdum nec pulvinar sit amet, fermentum eget lorem. Nunc id odio id metus lobortis interdum. Aenean elit mauris, ornare non ullamcorper et, fermentum rutrum enim. Nullam risus leo, rutrum sed lacinia eu, dignissim congue nisl. Sed vel lectus sit amet ligula ullamcorper fermentum. Etiam elementum fermentum odio sit amet pretium. Integer a nisl nec nisi placerat rutrum. Duis ac mi rutrum metus lobortis hendrerit nec sed est. Pellentesque condimentum dui at nunc interdum sed viverra enim auctor. Aenean feugiat, sapien posuere hendrerit vehicula, tortor dui pretium metus, vitae consequat nibh augue nec turpis. Donec lobortis tincidunt tristique. Duis sit amet ligula arcu, et hendrerit nunc.');
