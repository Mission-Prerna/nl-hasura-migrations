CREATE TABLE "public"."designations" ("id" serial NOT NULL, "name" bpchar NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );
