create schema SocialNetwork;

CREATE TABLE socialnetwork.post
(
    post_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    content TEXT,
    tags TEXT[],
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_public BOOLEAN DEFAULT TRUE
);

CREATE TABLE socialnetwork.post_like
(
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    liked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, post_id)
);


INSERT INTO socialnetwork.post (user_id, content, tags, created_at, is_public)
VALUES
    (1, 'Du lịch Đà Lạt cuối tuần thật tuyệt', ARRAY['travel', 'dalat'], NOW() - INTERVAL '2 days', TRUE),
    (2, 'Học SQL để tối ưu database', ARRAY['sql', 'database', 'tech'], NOW() - INTERVAL '10 days', TRUE),
    (3, 'Món ăn yêu thích khi du lịch biển', ARRAY['food', 'travel'], NOW() - INTERVAL '1 day', TRUE),
    (1, 'Bài viết nội bộ chỉ bạn bè thấy', ARRAY['private', 'note'], NOW() - INTERVAL '3 days', FALSE),
    (4, 'Du lịch Hà Giang mùa này đẹp quá', ARRAY['travel', 'hagiang'], NOW() - INTERVAL '6 days', TRUE),
    (5, 'Review laptop mới mua', ARRAY['tech', 'review'], NOW() - INTERVAL '8 days', TRUE),
    (2, 'Kinh nghiệm du lịch tự túc', ARRAY['travel', 'tips'], NOW() - INTERVAL '4 days', TRUE),
    (3, 'Chia sẻ về món phở Hà Nội', ARRAY['food', 'hanoi'], NOW() - INTERVAL '12 days', TRUE),
    (4, 'Học PostgreSQL index thực chiến', ARRAY['postgresql', 'database', 'tech'], NOW() - INTERVAL '5 days', TRUE),
    (5, 'Bài viết riêng tư của tôi', ARRAY['private'], NOW() - INTERVAL '2 days', FALSE);

INSERT INTO socialnetwork.post_like (user_id, post_id, liked_at)
VALUES
    (2, 1, NOW() - INTERVAL '1 day'),
    (3, 1, NOW() - INTERVAL '1 day'),
    (4, 1, NOW() - INTERVAL '12 hours'),
    (1, 2, NOW() - INTERVAL '7 days'),
    (3, 2, NOW() - INTERVAL '6 days'),
    (1, 3, NOW() - INTERVAL '8 hours'),
    (2, 3, NOW() - INTERVAL '7 hours'),
    (5, 4, NOW() - INTERVAL '2 days'),
    (1, 5, NOW() - INTERVAL '5 days'),
    (2, 7, NOW() - INTERVAL '2 days'),
    (3, 7, NOW() - INTERVAL '1 day'),
    (4, 9, NOW() - INTERVAL '1 day');



/*
 CÂU 1: Expression Index (LOWER(content))
*/

/* Trước khi tạo index */
EXPLAIN ANALYZE
SELECT *
FROM socialnetwork.post
WHERE is_public = TRUE
  AND LOWER(content) LIKE '%du lịch%';

/* Tạo index */
CREATE INDEX idx_post_lower_content
    ON socialnetwork.post (LOWER(content));

/* Sau khi tạo index */
EXPLAIN ANALYZE
SELECT *
FROM socialnetwork.post
WHERE is_public = TRUE
  AND LOWER(content) LIKE '%du lịch%';



/*
 CÂU 2: GIN Index cho tags
*/

/* Trước khi tạo index */
EXPLAIN ANALYZE
SELECT *
FROM socialnetwork.post
WHERE tags @> ARRAY['travel'];

/* Tạo GIN index */
CREATE INDEX idx_post_tags_gin
    ON socialnetwork.post USING GIN(tags);

/* Sau khi tạo index */
EXPLAIN ANALYZE
SELECT *
FROM socialnetwork.post
WHERE tags @> ARRAY['travel'];



/*
 CÂU 3: Partial Index (bài public gần đây)
*/

/* Tạo Partial Index */
CREATE INDEX idx_post_recent_public
    ON socialnetwork.post(created_at DESC)
    WHERE is_public = TRUE;

/* Kiểm tra hiệu suất */
EXPLAIN ANALYZE
SELECT *
FROM socialnetwork.post
WHERE is_public = TRUE
  AND created_at >= NOW() - INTERVAL '7 days';



/*
 CÂU 4: Composite Index (user_id, created_at)
*/

/* Tạo composite index */
CREATE INDEX idx_post_user_created_at
    ON socialnetwork.post(user_id, created_at DESC);

/* Query kiểm tra */
EXPLAIN ANALYZE
SELECT *
FROM socialnetwork.post
WHERE user_id IN (2, 3, 4)
ORDER BY created_at DESC
LIMIT 10;