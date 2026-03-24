CREATE TABLE IF NOT EXISTS messages_backup (
    tg_chat_id  INTEGER NOT NULL,
    tg_msg_id   INTEGER NOT NULL,
    max_chat_id INTEGER NOT NULL,
    max_msg_id  TEXT NOT NULL,
    created_at  INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY (tg_chat_id, tg_msg_id)
);
INSERT OR IGNORE INTO messages_backup (tg_chat_id, tg_msg_id, max_chat_id, max_msg_id, created_at)
    SELECT tg_chat_id, tg_msg_id, max_chat_id, max_msg_id, created_at FROM messages;
DROP TABLE messages;
ALTER TABLE messages_backup RENAME TO messages;
CREATE INDEX IF NOT EXISTS idx_messages_max ON messages(max_msg_id);
