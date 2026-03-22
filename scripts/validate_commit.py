import os
import sys
import json


def validate_commit():
    event_path = os.getenv("GITHUB_EVENT_PATH")

    with open(event_path, "r") as f:
        event = json.load(f)

    commit_message = event.get("head_commit", {}).get("message", "")

    print(f"Commit message: {commit_message}")

    output_path = os.getenv("GITHUB_OUTPUT")

    if "[deploy-prod]" in commit_message.lower():
        print("Commit is valid")

        with open(output_path, "a") as f:
            f.write("allow_apply=true\n")

    else:
        print("Commit is invalid")

        with open(output_path, "a") as f:
            f.write("allow_apply=false\n")

    sys.exit(0)


if __name__ == "__main__":
    validate_commit()