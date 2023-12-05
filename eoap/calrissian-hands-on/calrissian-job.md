

cat <<EOF | kubectl apply -f -
apiVersion: batch/v1
kind: Job
metadata:
  name: my-first-calrissian-job
spec:
  template:
    spec:
      serviceAccountName: default
      securityContext:
        runAsUser: 0
        runAsGroup: 0
        fsGroup: 0
      containers:
        - name: calrissian
          image: ghcr.io/duke-gcb/calrissian/calrissian:0.16.0
          command: ["calrissian"]
          args:
            - "--stdout"
            - "/calrissian-out/execution-results.json"
            - "--stderr"
            - "/calrissian-out/execution.log"
            - "--usage-report"
            - "/calrissian-out/usage-report.json"
            - "--max-ram"
            - "2Gi"
            - "--max-cores"
            - "1"
            - "--tmp-outdir-prefix"
            - "/calrissian-tmp"
            - "--debug"
            - "--outdir"
            - "/calrissian-out"
            - "/workflow.cwl"
            - "/workflow-inputs.yaml"
          volumeMounts:
            - mountPath: "/calrissian-out"
              name: calrissian-out
            - mountPath: "/calrissian-tmp"
              name: calrissian-tmp
            - name: cwl-workflow
              mountPath: /workflow.cwl
              subPath: cwl-workflow
            - name: workflow-inputs
              mountPath: /workflow-inputs.yaml
              subPath: inputs
          env:
            - name: CALRISSIAN_POD_NAME
              valueFrom:
                fieldRef:
                  fieldPath: metadata.name
        restartPolicy: Never
        volumes:
        - name: cwl-workflow
          configMap:
            name: cwl-workflow
        - name: workflow-input
          configMap:
            name: inputs
        - name: calrissian-out
          persistentVolumeClaim:
            claimName: calrissian-out
        - name: calrissian-tmp
          persistentVolumeClaim:
            claimName: calrissian-tmp
EOF{{execute}}