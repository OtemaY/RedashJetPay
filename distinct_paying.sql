
SELECT date_trunc('month', CAST("public"."payments_transaction"."updated_at" AS date)) AS "updated_at", count(distinct "account_account__via__payer_ac"."email") AS "count"
FROM "public"."payments_transaction"
LEFT JOIN "public"."account_account" "account_account__via__payer_ac" ON "public"."payments_transaction"."payer_account_id" = "account_account__via__payer_ac"."id"
WHERE (("public"."payments_transaction"."status" = 'paid'
    OR "public"."payments_transaction"."status" = 'settled')
   AND "account_account__via__payer_ac"."created_at" > DATE '2021-03-01' AND "public"."payments_transaction"."total_amount_paid" >= 50 AND "public"."payments_transaction"."created_at" >= DATE '2021-05-01' AND "account_account__via__payer_ac"."is_demo_account" = FALSE AND ("public"."payments_transaction"."vendor_account_id" = 384 OR "public"."payments_transaction"."vendor_account_id" = 587 OR "public"."payments_transaction"."is_side_loaded_transaction" = True))
GROUP BY date_trunc('month', CAST("public"."payments_transaction"."updated_at" AS date))
ORDER BY date_trunc('month', CAST("public"."payments_transaction"."updated_at" AS date)) ASC
