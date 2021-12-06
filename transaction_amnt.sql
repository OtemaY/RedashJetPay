SELECT sum("public"."payments_transaction"."total_amount_paid") AS "sum"
FROM "public"."payments_transaction"
LEFT JOIN "public"."account_account" "account_account__via__payer_ac" ON "public"."payments_transaction"."payer_account_id" = "account_account__via__payer_ac"."id"
WHERE ("account_account__via__payer_ac"."is_demo_account" = FALSE
   AND ("public"."payments_transaction"."status" = 'paid'
    OR "public"."payments_transaction"."status" = 'settled') AND ("public"."payments_transaction"."vendor_account_id" = 384 OR "public"."payments_transaction"."vendor_account_id" = 587  OR "public"."payments_transaction"."is_side_loaded_transaction" = True) AND "public"."payments_transaction"."created_at" >= timestamp with time zone '2021-05-02 00:00:00.000Z' AND "public"."payments_transaction"."transaction_amount" >= 9 AND "account_account__via__payer_ac"."created_at" > timestamp with time zone '2021-03-01 00:00:00.000Z')
