require "jekyll-import"

JekyllImport::Importers::WordPress.run({
  "dbname"   => "orgraphone",
  "user"     => "root",
  "password" => "",
  "host"     => "127.0.0.1",
  "socket"   => "",
  "table_prefix"   => "wp_",
  "clean_entities" => true,
  "comments"       => true,
  "categories"     => false,
  "tags"           => true,
  "more_excerpt"   => true,
  "more_anchor"    => true,
  "status"         => ["publish"]
})
