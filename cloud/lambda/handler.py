import json


def handler(event, context):
    name = event.get("name", "свят")
    body = json.dumps({"message": f"Здравей, {name}!"}, ensure_ascii=False)
    return {"statusCode": 200, "body": body}
